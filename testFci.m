function resultG = testFci(dataSet,alpha)
% apply FCI algorithm implement in Tetrad on data
% Input:
% dataSet: data in Tetrad form
% alpha: the threshold of independence test
%
% Output:
% resultG: A PAG learned by FCI from data


import edu.cmu.tetrad.*
import java.util.*
import java.lang.*
import edu.cmu.tetrad.data.*
import edu.cmu.tetrad.graph.*
import edu.cmu.tetrad.search.*
import edu.cmu.tetrad.util.*
import edu.cmu.tetrad.search.indtest.*

 
independenceTest = IndTestFisherZ(dataSet,alpha);
test = IndTestFisherZ(dataSet, alpha);   % type of independent test
search1 = Fci(test);     % Fci class
resultG =search1.search();   % use Fci to output a PAG