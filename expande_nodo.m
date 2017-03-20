function exp_nodo=expande_nodo(node_x,node_y,hn,xTarget,yTarget,CLOSED,MAX_X,MAX_Y,vecindad)
    % Función que expande un nodo con las celdas vecinas
    % Devuelve la lista de sucesoras expandidas y su valor de coste fn
    % Las sucesoras no pueden ser las que están en la lista CLOSED, ni la
    % propia.
    % El argumento de entrada "vecindad" selecciona la 4/8 vecindad

    % Formato del nodo expandido
    %--------------------------------
    %|X val |Y val ||h(n) |g(n)|f(n)|
    %--------------------------------
    
    %%%%%%%%%%%%%%%%%%%%%  COMPLETAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    count_nodes = 0;
    exp_nodo = [[]];
    
    if vecindad == 4
        nodes_x_diff = [-1 1];
        nodes_y_diff = [-1 1];
        % x-axis
        for i=1:2
            next_n_x = node_x + nodes_x_diff(i);
            next_n_y = node_y;
            % check whether node is in range
            if is_node_in_map(next_n_x, next_n_y, MAX_X, MAX_Y)
                % expand node if it isn't in the CLOSED list
                tried_exp_node = try_exp_node(next_n_x, next_n_y, hn, xTarget, yTarget, CLOSED);
                if (tried_exp_node(1) ~= 0)
                    % add node to expanded nodes list
                    count_nodes = count_nodes + 1;
                    exp_nodo(count_nodes, :) = tried_exp_node;
                end
            end
        end
        % y-axis
        for i=1:2
            next_n_x = node_x;
            next_n_y = node_y + nodes_y_diff(i);
            % check whether node is in range
            if is_node_in_map(next_n_x, next_n_y, MAX_X, MAX_Y)
                % expand node if it isn't in the CLOSED list
                tried_exp_node = try_exp_node(next_n_x, next_n_y, hn, xTarget, yTarget, CLOSED);
                if (tried_exp_node(1) ~= 0)
                    % add node to expanded nodes list
                    count_nodes = count_nodes + 1;
                    exp_nodo(count_nodes, :) = tried_exp_node;
                end
            end
        end
    elseif vecindad == 8
        nodes_x_diff = [-1 0 1];
        nodes_y_diff = [-1 0 1];
        % x-axis
        for i=1:3
            % y-axis
            for j=1:3
                % skip self
                if nodes_x_diff(i) == 0 && nodes_y_diff(j) == 0
                    continue;
                end
                next_n_x = node_x + nodes_x_diff(i);
                next_n_y = node_y + nodes_y_diff(j);
                % check whether node is in range
                if is_node_in_map(next_n_x, next_n_y, MAX_X, MAX_Y)
                    % expand node if it isn't in the CLOSED list
                    tried_exp_node = try_exp_node(next_n_x, next_n_y, hn, xTarget, yTarget, CLOSED);
                    if (tried_exp_node(1) ~= 0)
                        % add node to expanded nodes list
                        count_nodes = count_nodes + 1;
                        exp_nodo(count_nodes, :) = tried_exp_node;
                    end
                end
            end
        end
    end
end