# 2022 IC Design Contest (Cell-Based IC Design Category)
## *Job Assignment Machine*
* ***Our result meets the Level A and our submission time allow us to enter the final contest.***
  * Level A：
  1. Gate-level and RTL simulations are completely correct given the clock period of 10ns.
  2. Goal 1 is met: **total simulation cycle is smaller than 600000 cycles**
  3. Goal 2 is met: **Area is smaller than 10000um^2 after synthesis** (i.e. Total cell area)
  * Grading for level A：
    * According to the submission time
    * | Cycle | Synthesis area | 
      | :----:| :----:         |
      | 403208  |  6803.179229 |

### System Description 
* List all possible combinations and calculate the combination that delivers the minimum job cost. In 
this problem you need to design the circuit of JAM for the case of n = 8 (assigning 8 workers for 8 jobs)

### Implementation
  * Design the system archiectcure (I/O interfaces)
  * Implement the Full Permutation Algorithm
  * Calculate the total job cost to find MinCost, MatchCount

### Result for area
![area](https://user-images.githubusercontent.com/61014449/165154179-822401d5-7ccc-426a-8549-a34e9093a3d8.png)

### Result for simulation (Pre-sim & Gate-sim passed)
  * **Pattern 1** <br>
  <img src="https://user-images.githubusercontent.com/61014449/165154195-99f5cb2e-676e-4377-8e7c-9897710332e6.png" width="800"/><br/>
  * **Pattern 2** <br>
  <img src="https://user-images.githubusercontent.com/61014449/165154201-e3ebe51d-ec8a-4d0a-9d5e-7d039e80eadd.png" width="800"/><br/>
  * **Pattern 3** <br>
  <img src="https://user-images.githubusercontent.com/61014449/165154202-3532293e-5a60-4fc6-b267-0c64d875266f.png" width="800"/><br/>
