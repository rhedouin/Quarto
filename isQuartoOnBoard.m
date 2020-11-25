function output = isQuartoOnBoard(board, winningPosition)

    output = 0;
    for k = 1:size(winningPosition,1)
        output = isQuarto(board(winningPosition(k,1),:), board(winningPosition(k,2),:), ...
                 board(winningPosition(k,3),:), board(winningPosition(k,4),:));
        if output
            break
        end
    end
          
end