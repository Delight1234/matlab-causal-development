function tGraph= matrixToTetradGraph(dag)
% transfer pag matrix form in maltab to tetrad graph form
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

for x=1:nVars-1
    for y =x+1:nVars
        if dag(x, y) ==0
            continue;
        end
        if dag(x,y) == 2 
            if dag(y, x) == 1
                tGraph.addDirectedEdge(list.get(x-1), list.get(y-1));
            elseif dag(y, x) ==2
                tGraph.addDirectedEdge(list.get(x-1), list.get(y-1));
                tGraph.addBidirectedEdge(list.get(x-1), list.get(y-1));
            elseif dag(y, x) ==2
                tGraph.addBidirectedEdge(list.get(x-1), list.get(y-1));
            end
        elseif dag(x, y)== 3
            tGraph.addDirectedEdge(list.get(y-1), list.get(x-1));
        elseif dag(x, y)== 4
            tGraph.addBidirectedEdge(list.get(y-1), list.get(x-1));
        end
    end % end for y
end % end for x

end