% test is Quarto

p1 = [1,0,0,0];
p2 = [1,1,0,0];
p3 = [1,0,1,0];
p4 = [1,0,0,1];

v = 1:16;

winningPosition = [1, 2, 3, 4; % 4 Row lines
5, 6, 7, 8; 
9, 10, 11, 12;
 13, 14, 15, 16; 
 
 1, 5, 9, 13; % 4 Columns lines
 2, 6, 10, 14; 
 3, 7, 11, 15;
 4, 8, 12, 16;
 
 1, 6, 11, 16; % 2 Diagonals
 4, 7, 10, 13;
    
 1, 2, 5, 6;   % 9 Small squares
 2, 3, 6, 7;
 3, 4, 7, 8;
 5, 6, 9, 10;
 6, 7, 10, 11;
 7, 8, 11, 12;
 8, 9, 13, 14;
 9, 10, 14, 15;
 10, 11, 15, 16;
 
 1, 3, 9, 11; % 4 Middle squares
 2, 4, 10, 12;
 5, 7, 13, 15;
 6, 8, 14, 16;
 
 1, 4, 13, 16 % 1 Large squares
 
 2, 5, 7, 10; % 4 Small diagonal squares
 3, 6, 8, 11;
 6, 9, 11, 14;
 7, 10, 12, 15;
 
 2, 8, 9, 15; % 2 Small diagonal squares
 3, 5, 12, 14];

% Board creation

Board(1,:) = [0, 0, 0, 0];
Board(2,:) = [0, 0, 0, 1];
Board(3,:) = [0, 0, 1, 0];
Board(4,:) = [0, 0, 1, 1];
 
Board(5,:) = [0, 1, 0, 0];
Board(6,:) = [0, 1, 0, 1];
Board(7,:) = [0, 1, 1, 0];
Board(8,:) = [0, 1, 1, 1];

Board(9,:) = [1, 0, 0, 0];
Board(10,:) = [1, 0, 0, 1];
Board(11,:) = [1, 0, 1, 0];
Board(12,:) = [1, 0, 1, 1];
 
Board(13,:) = [1, 1, 0, 0];
Board(14,:) = [1, 1, 0, 1];
Board(15,:) = [1, 1, 1, 0];
Board(16,:) = [1, 1, 1, 1];

boumboum = 1;
it = 0;
tStart = tic;

rng('default')

numValid = 0;
while boumboum
    it = it +1;
    k = randi(2*1e13 + 1 );

    if mod(it,100000) == 0
        display(['it = ' num2str(it) ' jusqu ici tout va bien']);
        display(['on est a ' num2str(100*numValid/it) ' % de match nul']);
        display(['POUIC POUIC'])
    end
    
    thisPerm = oneperm(16, k);

    for l = 1:16
        currentBoard(l, :) =  Board(thisPerm(l),:);
    end
    
     boumboum = isQuartoOnBoard(currentBoard, winningPosition);
    if  ~boumboum
        it
        'y manque un seau'
        numValid = numValid + 1;
        boumboum = 1;
        currentBoard
        return;
    end
end
