function exp_node = try_exp_node(node_x, node_y, hn, xTarget, yTarget, CLOSED)
    exp_node = 0;
    % if node doesn't exist in CLOSED list
    [~, index] = ismember([node_x, node_y], CLOSED, 'rows');
    if index == 0
        exp_node = [];
        exp_node(1) = node_x;
        exp_node(2) = node_y;
        exp_node(3) = hn + 1;
        exp_node(4) = distance(node_x, node_y, xTarget, yTarget);
        exp_node(5) = exp_node(3) + exp_node(4);
    end
end

