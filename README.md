
<!-- README.md is generated from README.Rmd. Please edit that file -->

# edld652

<!-- badges: start -->
<!-- badges: end -->

This is course package meant to help ease the burden of downloading and
accessing the course data. Functions will likely be added to the package
as the course goes along.

## Installation

You can install **edld652** with:

``` r
remotes::install_github("datalorax/edld652")
```

## Example

If you are a student in this class, a shared access signature (SAS) will
be shared with you. This is what authenticates you to obtain access to
the data. To start, you will need to pass the SAS to `set_key()` as a
string (e.g., `set_key("abc-key-but-really-long-and-complicated")`). You
will only need to do this once, and the package will prompt you to do
this upon loading it if it hasn’t been done previously. The SAS will be
stored in your .REnviron (you could use something like
`usethis::edit_r_environ()` if you want to see it). After running
`set_key()` you will be prompted to restart R for the changes to take
effect.

Once you have stored your SAS authentication token with `set_key()`, you
can import any dataset available with the `get_data()` function.
However, you might be asking yourself “how do I know what file I want?”.
We can get a list of all available datasets with the `list_datasets()`
function. For example:

``` r
library(edld652)
list_datasets()
#>  [1] "EDFacts_acgr_lea_2011_2019"                                
#>  [2] "EDFacts_acgr_sch_2011_2019"                                
#>  [3] "EDFacts_math_achievement_lea_2010_2019"                    
#>  [4] "EDFacts_math_achievement_sch_2010_2019"                    
#>  [5] "EDFacts_math_participation_lea_2013_2019"                  
#>  [6] "EDFacts_math_participation_sch_2013_2019"                  
#>  [7] "EDFacts_rla_achievement_lea_2010_2019"                     
#>  [8] "EDFacts_rla_achievement_sch_2010_2019"                     
#>  [9] "EDFacts_rla_participation_lea_2013_2019"                   
#> [10] "EDFacts_rla_participation_sch_2013_2019"                   
#> [11] "NCES_CCD_fiscal_district_2010"                             
#> [12] "NCES_CCD_fiscal_district_2011"                             
#> [13] "NCES_CCD_fiscal_district_2012"                             
#> [14] "NCES_CCD_fiscal_district_2013"                             
#> [15] "NCES_CCD_fiscal_district_2014"                             
#> [16] "NCES_CCD_fiscal_district_2015"                             
#> [17] "NCES_CCD_fiscal_district_2016"                             
#> [18] "NCES_CCD_fiscal_district_2017"                             
#> [19] "NCES_CCD_fiscal_district_2018"                             
#> [20] "NCES_CCD_nonfiscal_district_2017_2021_directory"           
#> [21] "NCES_CCD_nonfiscal_district_2017_2021_disabilities"        
#> [22] "NCES_CCD_nonfiscal_district_2017_2021_english_learners"    
#> [23] "NCES_CCD_nonfiscal_district_2017_2021_membership"          
#> [24] "NCES_CCD_nonfiscal_district_2017_2021_staff"               
#> [25] "NCES_CCD_nonfiscal_school_2017_2020_lunch_program"         
#> [26] "NCES_CCD_nonfiscal_school_2017_2020_school_characteristics"
#> [27] "NCES_CCD_nonfiscal_school_2017_2020_staff"                 
#> [28] "NCES_CCD_nonfiscal_school_2017_2021_directory"             
#> [29] "NCES_CCD_nonfiscal_school_2017_membership"                 
#> [30] "NCES_CCD_nonfiscal_school_2018_membership"                 
#> [31] "NCES_CCD_nonfiscal_school_2019_membership"                 
#> [32] "NCES_CCD_nonfiscal_school_2020_membership"                 
#> [33] "NCES_CCD_nonfiscal_state_2017_2020_directory"              
#> [34] "NCES_CCD_nonfiscal_state_2017_2020_staff"                  
#> [35] "NCES_CCD_nonfiscal_state_2017_2021_membership"
```

From here, we can just copy the string of the dataset we want to import
and pass that to `get_data()`. For example, if we wanted to read in
`"EDFacts_acgr_lea_2011_2019"`, we would use the following code

``` r
district_grad_rates <- get_data("EDFacts_acgr_lea_2011_2019")
#> Rows: 11326 Columns: 29
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr  (17): ALL_RATE, CWD_RATE, DATE_CUR, ECD_RATE, FIPST, FILEURL, LEAID, LE...
#> dbl  (11): ALL_COHORT, CWD_COHORT, ECD_COHORT, LEP_COHORT, MAM_COHORT, MAS_C...
#> dttm  (1): DL_INGESTION_DATETIME
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
district_grad_rates
#> # A tibble: 11,326 × 29
#>    ALL_COHORT ALL_RATE CWD_COHORT CWD_RATE DATE_CUR ECD_COHORT ECD_RATE FIPST
#>         <dbl> <chr>         <dbl> <chr>    <chr>         <dbl> <chr>    <chr>
#>  1        252 80                3 PS       03OCT15         121 65-69    01   
#>  2        398 75               47 70-79    03OCT15         233 65-69    01   
#>  3       1020 89               51 40-49    03OCT15         175 75-79    01   
#>  4        750 91               35 60-69    03OCT15         102 80-84    01   
#>  5        128 55-59            15 LT50     03OCT15          68 40-44    01   
#>  6        166 90-94             9 GE50     03OCT15          53 70-79    01   
#>  7        336 90               30 60-79    03OCT15          35 60-69    01   
#>  8        273 77               11 LT50     03OCT15          93 70-74    01   
#>  9        134 70-74             4 PS       03OCT15          60 50-59    01   
#> 10        266 58               33 50-59    03OCT15         195 55-59    01   
#> # … with 11,316 more rows, and 21 more variables: FILEURL <chr>, LEAID <chr>,
#> #   LEANM <chr>, LEP_COHORT <dbl>, LEP_RATE <chr>, MAM_COHORT <dbl>,
#> #   MAM_RATE <chr>, MAS_COHORT <dbl>, MAS_RATE <chr>, MBL_COHORT <dbl>,
#> #   MBL_RATE <chr>, MHI_COHORT <dbl>, MHI_RATE <chr>, MTR_COHORT <dbl>,
#> #   MTR_RATE <chr>, MWH_COHORT <dbl>, MWH_RATE <chr>, STNAM <chr>, YEAR <dbl>,
#> #   PIPELINE <chr>, DL_INGESTION_DATETIME <dttm>
```

An Excel document providing documentation for each dataset will be
shared with you, but is also available
[here](https://github.com/uo-datasci-specialization/c2-dataviz-2022/raw/main/data/UO%20ED%20Data%20Share.xlsx).
