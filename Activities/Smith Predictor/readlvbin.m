function output = readlvbin(bin_file, n_channels)
% This function converts LabVIEW binary file into TAB delimitted text file.
%
% bin_file: the binary file must be composed by n_channels of double 
% DOUBLE-type data.
%
% n_channels: number of channels
% output: channel-1 is in row-1
%         channel-2 is in row-2
%         channel-3 is in row-3
%         and so on ...
%
% Example = data = readlvbin('logged_data.bin', 45);
%
% Contact: manurunga@yandex.com
    
    fid = fopen(bin_file, 'r');

    % Find out the length of the file in bytes
    fseek(fid, 0,'eof');
    filelength = ftell(fid);
    frewind(fid);
    
    % Read the file, 1 double = 8 bytes, read per 8 bytes, convert into
    % double
    % Since all fields are in double, filelength mustbe factor of 8
    output = fread(fid, filelength/8, 'double');
    
    % Length of the output must be factor of n_channels
    % Reshape accordaingly to the number of n_channels
    if mod(length(output)/n_channels, 1) == 0 % Integer value?
        output = reshape(output, n_channels, length(output)/n_channels);
    else
        disp('Are you sure you gave the right number of channels?')
        output = 0;
    end
    
    fclose(fid);
end