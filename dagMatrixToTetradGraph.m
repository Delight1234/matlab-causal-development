function tGraph= dagMatrixToTetradGraph(dag)
% transfer dag matrix form in matlab to tetrad graph form
import edu.cmu.tetrad.*
import java.util.*
import edu.cmu.tetrad.graph.*
import edu.cmu.tetrad.search.*

nVars =size(dag,1);
array = javaArray('edu.cmu.tetrad.graph.GraphNode', nVars);

for i=1:nVars
    array(i) =GraphNode(['X', num2str(i)]);
end

list  = Arrays.asList(array);
tGraph = EdgeListGraph(list);   

for i=1:nVars
    for j =1:nVars
        if dag(i, j) ==0
            continue;
        end
        if dag(i,j) == 1   
             tGraph.addDirectedEdge(list.get(i-1), list.get(j-1));
        end
    end % end for y
end % end for x

end