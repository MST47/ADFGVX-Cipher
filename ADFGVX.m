%--------- ADFGVX Cipher implementation in MATLAB --------------

% Function to create the Polybius Square
% generate polybius_square using any word
function polybius_square = create_polybius_square(word)
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    word = upper(word);
    polybius_square = [];
    for char = word  % Placing character of word first
        if ~any(polybius_square == char) 
            polybius_square = [polybius_square char]; 
        end
    end
    for char = alphabet  % After word characters placing other alphabets
        if ~any(polybius_square == char)
            polybius_square = [polybius_square char];
        end
    end
    polybius_square = reshape(polybius_square, 6, 6);
end


% % Function to encrypt the message
function Ciphertext = encrypt(message, polybius_square,key)
    message =upper(regexprep(message, '\s+', ''));
    adfgvx = ['A' 'D' 'F' 'G' 'V' 'X'];
    encrypted_message = '';
    for char = message
        for row = 1:6
            for col = 1:6
                if polybius_square(row, col) == char  %picking corresponding row and column entry
                    encrypted_message = [encrypted_message adfgvx(row) adfgvx(col)]; 
                end
            end
        end
    end
    % Making the message as multiple of 6
    pad_m=[encrypted_message, repmat(' ', 1, 6-(mod(length(encrypted_message),6)))];
    encr_msg = reshape(pad_m, 6, [])';
    [sorted_c, indices] = sort(double (reshape(key, 1, []).'));
    % pick columns in ascending order from the key 
    ciphert=[encr_msg(:,indices)]; 
    Ciphertext =  ciphert(:)'; % Joi them in one row
    

end
% 
% Function to decrypt the encrypted message
function decrypted_message = decrypt(encrypted_message, polybius_square,key)
    decrypted_message = '';
    ciphert=(reshape(encrypted_message, [], 6)); % Arranging into matrix
    [sorted_c, indices] = sort(double (reshape(key, 1, []).')); %indices
    A =char(zeros (size(ciphert)));% dummy var to store columns

    for i = 1:length(indices)
        A(:, indices(i)) = ciphert(:,i); 
    end
     B = reshape(A', 1,[]);

    for i = 1:2:length(B)
        row = find('ADFGVX' == B(i));
        col = find('ADFGVX' == B(i+1));
        decrypted_message = [decrypted_message polybius_square(row, col)];
    end
    
end


% % Example usage
 word = 'HIMOMILOVEYOU';
 polybius_square = create_polybius_square(word);
 
 key = 'SECRET';
 message = 'You see but you dont see';
 encrypted_messag =encrypt(message, polybius_square,key);
 encrypted_message=regexprep(encrypt(message, polybius_square,key),'\s+', '');
 decrypted_message = decrypt(encrypted_messag, polybius_square,key);
 % Determine the positions of spaces in the original plaintext
 spacePositions = strfind(message, ' ');
 % Insert spaces at the original positions
 for i = 1:numel(spacePositions)
     decrypted_message = [decrypted_message(1:spacePositions(i)-1) ' ' decrypted_message(spacePositions(i):end)];
 end
 decrypted_message = [decrypted_message(1) lower(decrypted_message(2:end))];

% 
 disp('Polybius Square:');
 disp(polybius_square);
 disp(['Key: ' key]);
 disp(['Message: ' message]);
 disp(['Encrypted Message: ' encrypted_message]);
 disp(['Decrypted Message: ' decrypted_message]);

 %--------- Histogram of Cipher text -------------------
% Convert each character to its ASCII code
numeric_data = double(encrypted_message);
numeric_data2 = double(message);

% Plot histogram
histogram(numeric_data2, 'BinMethod', 'auto');
subplot(2, 1, 1);
xlabel('Character in Plain Text');
ylabel('Frequency');
%title('Histogram of Plain Text Characters');


histogram(numeric_data, 'BinMethod', 'auto');
subplot(2, 1, 2);
% Add labels and title
xlabel('Character in Cipher Text');
ylabel('Frequency');
title('Character in Plain Text');

% Show plot
%grid on;



