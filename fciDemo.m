function fciDemo
% A demo that apply FCI on continue data

import edu.cmu.tetrad.*
import java.util.*
import java.lang.*
import edu.cmu.tetrad.data.*
import edu.cmu.tetrad.graph.*
import edu.cmu.tetrad.search.*
import edu.cmu.tetrad.util.*
import edu.cmu.tetrad.search.indtest.*

data=load('data/cheese2.txt');
dataSet = dataToTetradData(data);
alpha =0.01;

independenceTest = IndTestFisherZ(dataSet,alpha);
test = IndTestFisherZ(dataSet, alpha);   % type of independent test
search1 = Fci(test);     % Fci class
resultG =search1.search();   % use Fci to output a PAG