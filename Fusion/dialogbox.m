answer = questdlg('Would you like to edit the fused image?', ...
	'Enter your choice ', ...
	'YES','NO','NO');
% Handle response
switch answer
    case 'YES'
        run('test.m')
    case 'NO'
        moon = imread('fusedimage.jpg');
        imshow(moon);
        
        %title('Fused Image') 
    
end