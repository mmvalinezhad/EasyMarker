function EasyMarker(X,Y,Type,Start,Every,Marker,Marker_Size)
        
    Input(:,1) = X;
    Input(:,2) = Y;
    Counter = 1;
    
    if Type == 1
        Y = Start:Every:max(Input(:,1));
    elseif Type == 2
        j=1;
        for i = Start : Every
            Y(j) = 10.^(i-1);
            j = j + 1;
        end
    end
    
    for P = Y
    
        S1 = find(P > Input(:,1),1,'last');
        S2 = find(P <= Input(:,1),1);

        if isempty(S1) %first point
            O(Counter,1) = Input(1,1);
            O(Counter,2) = Input(1,2);
        elseif isempty(S2) %last point
            O(Counter,1) = Input(end,1);
            O(Counter,2) = Input(end,2);
        else %normal point
            Slope = (Input(S2,2)-Input(S1,2))/(Input(S2,1)-Input(S1,1));
            O(Counter,1) = P;
            O(Counter,2) = (Slope*P) - (Slope*Input(S1,1)) + (Input(S1,2));
        end
        Counter = Counter + 1;
    end
    
    plot(O(:,1),O(:,2),Marker,'MarkerSize',Marker_Size);
end

