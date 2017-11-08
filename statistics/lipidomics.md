## Lipidomics Data Analysis

* On a whole lipidome-wide scale, the goal of the differential expression analysis is to generate a list of all lipids 
that are differentially expressed. 
* For continuous concentration measurements, the group concentration level can be summarised by the mean expression level of the 
replicates. The problem is fundamentally comparison of the means. 
  * With two comparison groups, differential expression problem can be solved by conducting a t-test. 
  * With more than two comparison groups, one can conduct ANOVA.
* Thousands of hypotheses are tested simultaneously, casuing a problem of multiple comparisons. To avoid numerous false positive 
discoveries, some sort of multiple comparison correction, such as Bonferroni, FDR. 

