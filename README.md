# matlab-causal-development

Matlab code called Tetrad Library for causal modeling algorithms developed by the University of Pittsburgh/Carnegie Mellon University [Center for Causal Discovery](http://www.ccd.pitt.edu). 

## Requirements

Matlab 

[JDK 1.8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

## Installation

1. install JDK 1.8 and set the JAVA environment

2. launch Matlab with jdk 1.8:

   in Unbutu 14.04, input shell with 

   ```
   env MATLAB_JAVA=[filepath]/jre matlab
   ```

   (where [filepath] is your jdk 1.8 installation path.)

3. check the running java version in Matlab

   ```
   version -java
   ```

4. before running the project, add the path of Tetrad jar file in Matlab or add it in the Matlab's java path file

   such as

   ```(where '/home/cw/delight/matlab-causal-development/tetrad-gui-6.5.4-launch.jar' is the path of ‘tetrad-gui-6.5.4-launch.jar’)
   javaaddpath('/home/cw/Delight/matlab-causal-development/tetrad-gui-6.5.4-launch.jar');
   ```

​        (where '/home/cw/Delight/matlab-causal-development/tetrad-gui-6.5.4-launch.jar' is the path of ‘tetrad-gui-6.5.4-launch.jar’)

## Example

### Generate random Graph and data

```matlab
import edu.cmu.tetrad.sem.*;
import edu.cmu.tetrad.graph.*;
import edu.cmu.tetrad.search.*;

nodes = 10；
numLatentNodes = 5；
maxNumEdges = 10;  
sample = 1000;
ll=false;
trueG = GraphUtils.randomDag(nodes,numLatentNodes,maxNumEdges,4,2,2,false);

bayesPm = SemPm(trueG);
bayesIm = SemIm(bayesPm);
dataSet = bayesIm.simulateData(L,ll);
```

### Apply FCI on continue data

```
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
```