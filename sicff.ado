
// Program for turning SIC codes into Fama French 12 industries

// Takes a single input: the (numeric) variable identifying the SIC code

program sicff
	// Version
	version 10.0

	// Syntax
	syntax varname(numeric), INDustry(integer) [ GENerate(name local) Longlabels]
	
	// If user does not specify a name for newvar, then set newvar to "ff_`industry'"
	if "`generate'" == "" {
		local generate = "ff_`industry'"
	}

	// Validate the SIC codes
	capture assert inrange(sic, 1, 9999)
	if _rc {
		di as error "WARNING: SIC codes outside of 1 to 9999 will be set to missing."
	}

	// Create the variable
	qui gen byte `generate' = .
	
	// Fama French 5 industry
	if `industry' == 5 {

		// define label
		if "`longlabels'" != "" {
			// the long label
			label define lbl_ff_5 1 "(1) Consumer Durables, Nondurables, Wholesale, Retail, and Some Services (Laundries, Repair Shops)"
			label define lbl_ff_5 2 "(2) Manufacturing, Energy, and Utilities", add
			label define lbl_ff_5 3 "(3) Business Equipment, Telephone and Television Transmission", add
			label define lbl_ff_5 4 "(4) Healthcare, Medical Equipment, and Drugs", add
			label define lbl_ff_5 5 "(5) Other -- Mines, Constr, BldMt, Trans, Hotels, Bus Serv, Entertainment, Finance", add
		}
		else {
			// the short label
			label define lbl_ff_5 1 "(1) Cnsmr" 2 "(2) Manuf" 3 "(3) HiTec" 4 "(4) Hlth" 5 "(5) Other"
		}
		label values `generate' lbl_ff_5

		qui replace `generate' = 1 if inrange(`varlist', 0100, 0999) | inrange(`varlist', 2000, 2399) | inrange(`varlist', 2700, 2749) | inrange(`varlist', 2770, 2799) | inrange(`varlist', 3100, 3199) | inrange(`varlist', 3940, 3989) | inrange(`varlist', 2500, 2519) | inrange(`varlist', 2590, 2599) | inrange(`varlist', 3630, 3659) | inrange(`varlist', 3710, 3711) | inrange(`varlist', 3714, 3714) | inrange(`varlist', 3716, 3716) | inrange(`varlist', 3750, 3751) | inrange(`varlist', 3792, 3792) | inrange(`varlist', 3900, 3939) | inrange(`varlist', 3990, 3999) | inrange(`varlist', 5000, 5999) | inrange(`varlist', 7200, 7299) | inrange(`varlist', 7600, 7699)
		
		qui replace `generate' = 2 if inrange(`varlist', 2520, 2589) | inrange(`varlist', 2600, 2699) | inrange(`varlist', 2750, 2769) | inrange(`varlist', 2800, 2829) | inrange(`varlist', 2840, 2899) | inrange(`varlist', 3000, 3099) | inrange(`varlist', 3200, 3569) | inrange(`varlist', 3580, 3621) | inrange(`varlist', 3623, 3629) | inrange(`varlist', 3700, 3709) | inrange(`varlist', 3712, 3713) | inrange(`varlist', 3715, 3715) | inrange(`varlist', 3717, 3749) | inrange(`varlist', 3752, 3791) | inrange(`varlist', 3793, 3799) | inrange(`varlist', 3860, 3899) | inrange(`varlist', 1200, 1399) | inrange(`varlist', 2900, 2999) | inrange(`varlist', 4900, 4949)
		
		qui replace `generate' = 3 if inrange(`varlist', 3570, 3579) | inrange(`varlist', 3622, 3622) | inrange(`varlist', 3660, 3692) | inrange(`varlist', 3694, 3699) | inrange(`varlist', 3810, 3839) | inrange(`varlist', 7370, 7372) | inrange(`varlist', 7373, 7373) | inrange(`varlist', 7374, 7374) | inrange(`varlist', 7375, 7375) | inrange(`varlist', 7376, 7376) | inrange(`varlist', 7377, 7377) | inrange(`varlist', 7378, 7378) | inrange(`varlist', 7379, 7379) | inrange(`varlist', 7391, 7391) | inrange(`varlist', 8730, 8734) | inrange(`varlist', 4800, 4899)
		
		qui replace `generate' = 4 if inrange(`varlist', 2830, 2839) | inrange(`varlist', 3693, 3693) | inrange(`varlist', 3840, 3859) | inrange(`varlist', 8000, 8099)
		
		qui replace `generate' = 5 if `generate' == . & inrange(`varlist', 1, 9999)
	}



	// Fama French 10 industry
	else if `industry' == 10 {
		qui replace `generate' = 1 if `varlist' >= 0100 & `varlist' <= 0999
		qui replace `generate' = 1 if `varlist' >= 2000 & `varlist' <= 2399
		qui replace `generate' = 1 if `varlist' >= 2700 & `varlist' <= 2749
		qui replace `generate' = 1 if `varlist' >= 2770 & `varlist' <= 2799
		qui replace `generate' = 1 if `varlist' >= 3100 & `varlist' <= 3199
		qui replace `generate' = 1 if `varlist' >= 3940 & `varlist' <= 3989
		
		qui replace `generate' = 2 if `varlist' >= 2500 & `varlist' <= 2519
		qui replace `generate' = 2 if `varlist' >= 2590 & `varlist' <= 2599
		qui replace `generate' = 2 if `varlist' >= 3630 & `varlist' <= 3659
		qui replace `generate' = 2 if `varlist' >= 3710 & `varlist' <= 3711
		qui replace `generate' = 2 if `varlist' >= 3714 & `varlist' <= 3714
		qui replace `generate' = 2 if `varlist' >= 3716 & `varlist' <= 3716
		qui replace `generate' = 2 if `varlist' >= 3750 & `varlist' <= 3751
		qui replace `generate' = 2 if `varlist' >= 3792 & `varlist' <= 3792
		qui replace `generate' = 2 if `varlist' >= 3900 & `varlist' <= 3939
		qui replace `generate' = 2 if `varlist' >= 3990 & `varlist' <= 3999
		
		qui replace `generate' = 3 if `varlist' >= 2520 & `varlist' <= 2589
		qui replace `generate' = 3 if `varlist' >= 2600 & `varlist' <= 2699
		qui replace `generate' = 3 if `varlist' >= 2750 & `varlist' <= 2769
		qui replace `generate' = 3 if `varlist' >= 2800 & `varlist' <= 2829
		qui replace `generate' = 3 if `varlist' >= 2840 & `varlist' <= 2899
		qui replace `generate' = 3 if `varlist' >= 3000 & `varlist' <= 3099
		qui replace `generate' = 3 if `varlist' >= 3200 & `varlist' <= 3569
		qui replace `generate' = 3 if `varlist' >= 3580 & `varlist' <= 3621
		qui replace `generate' = 3 if `varlist' >= 3623 & `varlist' <= 3629
		qui replace `generate' = 3 if `varlist' >= 3700 & `varlist' <= 3709
		qui replace `generate' = 3 if `varlist' >= 3712 & `varlist' <= 3713
		qui replace `generate' = 3 if `varlist' >= 3715 & `varlist' <= 3715
		qui replace `generate' = 3 if `varlist' >= 3717 & `varlist' <= 3749
		qui replace `generate' = 3 if `varlist' >= 3752 & `varlist' <= 3791
		qui replace `generate' = 3 if `varlist' >= 3793 & `varlist' <= 3799
		qui replace `generate' = 3 if `varlist' >= 3860 & `varlist' <= 3899
		
		qui replace `generate' = 4 if `varlist' >= 1200 & `varlist' <= 1399
		qui replace `generate' = 4 if `varlist' >= 2900 & `varlist' <= 2999
		
		qui replace `generate' = 5 if `varlist' >= 3570 & `varlist' <= 3579
		qui replace `generate' = 5 if `varlist' >= 3622 & `varlist' <= 3622
		qui replace `generate' = 5 if `varlist' >= 3660 & `varlist' <= 3692
		qui replace `generate' = 5 if `varlist' >= 3694 & `varlist' <= 3699
		qui replace `generate' = 5 if `varlist' >= 3810 & `varlist' <= 3839
		qui replace `generate' = 5 if `varlist' >= 7370 & `varlist' <= 7372
		qui replace `generate' = 5 if `varlist' >= 7373 & `varlist' <= 7373
		qui replace `generate' = 5 if `varlist' >= 7374 & `varlist' <= 7374
		qui replace `generate' = 5 if `varlist' >= 7375 & `varlist' <= 7375
		qui replace `generate' = 5 if `varlist' >= 7376 & `varlist' <= 7376
		qui replace `generate' = 5 if `varlist' >= 7377 & `varlist' <= 7377
		qui replace `generate' = 5 if `varlist' >= 7378 & `varlist' <= 7378
		qui replace `generate' = 5 if `varlist' >= 7379 & `varlist' <= 7379
		qui replace `generate' = 5 if `varlist' >= 7391 & `varlist' <= 7391
		qui replace `generate' = 5 if `varlist' >= 8730 & `varlist' <= 8734
		
		qui replace `generate' = 6 if `varlist' >= 4800 & `varlist' <= 4899
		
		qui replace `generate' = 7 if `varlist' >= 5000 & `varlist' <= 5999
		qui replace `generate' = 7 if `varlist' >= 7200 & `varlist' <= 7299
		qui replace `generate' = 7 if `varlist' >= 7600 & `varlist' <= 7699
		
		qui replace `generate' = 8 if `varlist' >= 2830 & `varlist' <= 2839
		qui replace `generate' = 8 if `varlist' >= 3693 & `varlist' <= 3693
		qui replace `generate' = 8 if `varlist' >= 3840 & `varlist' <= 3859
		qui replace `generate' = 8 if `varlist' >= 8000 & `varlist' <= 8099
		
		qui replace `generate' = 9 if `varlist' >= 4900 & `varlist' <= 4949
		
		qui replace `generate' = 10 if `varlist' != . & `generate' == .
	}



	// Fama French 12 industry
	else if `industry' == 12 {
		qui replace `generate' = 1 if `varlist' >= 0100 & `varlist' <= 0999
		qui replace `generate' = 1 if `varlist' >= 2000 & `varlist' <= 2399
		qui replace `generate' = 1 if `varlist' >= 2700 & `varlist' <= 2749
		qui replace `generate' = 1 if `varlist' >= 2770 & `varlist' <= 2799
		qui replace `generate' = 1 if `varlist' >= 3100 & `varlist' <= 3199
		qui replace `generate' = 1 if `varlist' >= 3940 & `varlist' <= 3989
		
		qui replace `generate' = 2 if `varlist' >= 2500 & `varlist' <= 2519
		qui replace `generate' = 2 if `varlist' >= 2590 & `varlist' <= 2599
		qui replace `generate' = 2 if `varlist' >= 3630 & `varlist' <= 3659
		qui replace `generate' = 2 if `varlist' >= 3710 & `varlist' <= 3711
		qui replace `generate' = 2 if `varlist' >= 3714 & `varlist' <= 3714
		qui replace `generate' = 2 if `varlist' >= 3716 & `varlist' <= 3716
		qui replace `generate' = 2 if `varlist' >= 3750 & `varlist' <= 3751
		qui replace `generate' = 2 if `varlist' >= 3792 & `varlist' <= 3792
		qui replace `generate' = 2 if `varlist' >= 3900 & `varlist' <= 3939
		qui replace `generate' = 2 if `varlist' >= 3990 & `varlist' <= 3999
		
		qui replace `generate' = 3 if `varlist' >= 2520 & `varlist' <= 2589
		qui replace `generate' = 3 if `varlist' >= 2600 & `varlist' <= 2699
		qui replace `generate' = 3 if `varlist' >= 2750 & `varlist' <= 2769
		qui replace `generate' = 3 if `varlist' >= 3000 & `varlist' <= 3099
		qui replace `generate' = 3 if `varlist' >= 3200 & `varlist' <= 3569
		qui replace `generate' = 3 if `varlist' >= 3580 & `varlist' <= 3629
		qui replace `generate' = 3 if `varlist' >= 3700 & `varlist' <= 3709
		qui replace `generate' = 3 if `varlist' >= 3712 & `varlist' <= 3713
		qui replace `generate' = 3 if `varlist' >= 3715 & `varlist' <= 3715
		qui replace `generate' = 3 if `varlist' >= 3717 & `varlist' <= 3749
		qui replace `generate' = 3 if `varlist' >= 3752 & `varlist' <= 3791
		qui replace `generate' = 3 if `varlist' >= 3793 & `varlist' <= 3799
		qui replace `generate' = 3 if `varlist' >= 3830 & `varlist' <= 3839
		qui replace `generate' = 3 if `varlist' >= 3860 & `varlist' <= 3899
		
		qui replace `generate' = 4 if `varlist' >= 1200 & `varlist' <= 1399
		qui replace `generate' = 4 if `varlist' >= 2900 & `varlist' <= 2999
		
		qui replace `generate' = 5 if `varlist' >= 2800 & `varlist' <= 2829
		qui replace `generate' = 5 if `varlist' >= 2840 & `varlist' <= 2899
		
		qui replace `generate' = 6 if `varlist' >= 3570 & `varlist' <= 3579
		qui replace `generate' = 6 if `varlist' >= 3660 & `varlist' <= 3692
		qui replace `generate' = 6 if `varlist' >= 3694 & `varlist' <= 3699
		qui replace `generate' = 6 if `varlist' >= 3810 & `varlist' <= 3829
		qui replace `generate' = 6 if `varlist' >= 7370 & `varlist' <= 7379
		
		qui replace `generate' = 7 if `varlist' >= 4800 & `varlist' <= 4899
		
		qui replace `generate' = 8 if `varlist' >= 4900 & `varlist' <= 4949
		
		qui replace `generate' = 9 if `varlist' >= 5000 & `varlist' <= 5999
		qui replace `generate' = 9 if `varlist' >= 7200 & `varlist' <= 7299
		qui replace `generate' = 9 if `varlist' >= 7600 & `varlist' <= 7699
		
		qui replace `generate' = 10 if `varlist' >= 2830 & `varlist' <= 2839
		qui replace `generate' = 10 if `varlist' >= 3693 & `varlist' <= 3693
		qui replace `generate' = 10 if `varlist' >= 3840 & `varlist' <= 3859
		qui replace `generate' = 10 if `varlist' >= 8000 & `varlist' <= 8099
		
		qui replace `generate' = 11 if `varlist' >= 6000 & `varlist' <= 6999
		
		qui replace `generate' = 12 if `varlist' != . & `generate' == .
	}



	// Fama French 17 industry
	else if `industry' == 17 {
		qui replace `generate' = 1 if `varlist' >= 0100 & `varlist' <= 0199
		qui replace `generate' = 1 if `varlist' >= 0200 & `varlist' <= 0299
		qui replace `generate' = 1 if `varlist' >= 0700 & `varlist' <= 0799
		qui replace `generate' = 1 if `varlist' >= 0900 & `varlist' <= 0999
		qui replace `generate' = 1 if `varlist' >= 2000 & `varlist' <= 2009
		qui replace `generate' = 1 if `varlist' >= 2010 & `varlist' <= 2019
		qui replace `generate' = 1 if `varlist' >= 2020 & `varlist' <= 2029
		qui replace `generate' = 1 if `varlist' >= 2030 & `varlist' <= 2039
		qui replace `generate' = 1 if `varlist' >= 2040 & `varlist' <= 2046
		qui replace `generate' = 1 if `varlist' >= 2047 & `varlist' <= 2047
		qui replace `generate' = 1 if `varlist' >= 2048 & `varlist' <= 2048
		qui replace `generate' = 1 if `varlist' >= 2050 & `varlist' <= 2059
		qui replace `generate' = 1 if `varlist' >= 2060 & `varlist' <= 2063
		qui replace `generate' = 1 if `varlist' >= 2064 & `varlist' <= 2068
		qui replace `generate' = 1 if `varlist' >= 2070 & `varlist' <= 2079
		qui replace `generate' = 1 if `varlist' >= 2080 & `varlist' <= 2080
		qui replace `generate' = 1 if `varlist' >= 2082 & `varlist' <= 2082
		qui replace `generate' = 1 if `varlist' >= 2083 & `varlist' <= 2083
		qui replace `generate' = 1 if `varlist' >= 2084 & `varlist' <= 2084
		qui replace `generate' = 1 if `varlist' >= 2085 & `varlist' <= 2085
		qui replace `generate' = 1 if `varlist' >= 2086 & `varlist' <= 2086
		qui replace `generate' = 1 if `varlist' >= 2087 & `varlist' <= 2087
		qui replace `generate' = 1 if `varlist' >= 2090 & `varlist' <= 2092
		qui replace `generate' = 1 if `varlist' >= 2095 & `varlist' <= 2095
		qui replace `generate' = 1 if `varlist' >= 2096 & `varlist' <= 2096
		qui replace `generate' = 1 if `varlist' >= 2097 & `varlist' <= 2097
		qui replace `generate' = 1 if `varlist' >= 2098 & `varlist' <= 2099
		qui replace `generate' = 1 if `varlist' >= 5140 & `varlist' <= 5149
		qui replace `generate' = 1 if `varlist' >= 5150 & `varlist' <= 5159
		qui replace `generate' = 1 if `varlist' >= 5180 & `varlist' <= 5182
		qui replace `generate' = 1 if `varlist' >= 5191 & `varlist' <= 5191
		
		qui replace `generate' = 2 if `varlist' >= 1000 & `varlist' <= 1009
		qui replace `generate' = 2 if `varlist' >= 1010 & `varlist' <= 1019
		qui replace `generate' = 2 if `varlist' >= 1020 & `varlist' <= 1029
		qui replace `generate' = 2 if `varlist' >= 1030 & `varlist' <= 1039
		qui replace `generate' = 2 if `varlist' >= 1040 & `varlist' <= 1049
		qui replace `generate' = 2 if `varlist' >= 1060 & `varlist' <= 1069
		qui replace `generate' = 2 if `varlist' >= 1080 & `varlist' <= 1089
		qui replace `generate' = 2 if `varlist' >= 1090 & `varlist' <= 1099
		qui replace `generate' = 2 if `varlist' >= 1200 & `varlist' <= 1299
		qui replace `generate' = 2 if `varlist' >= 1400 & `varlist' <= 1499
		qui replace `generate' = 2 if `varlist' >= 5050 & `varlist' <= 5052
		
		qui replace `generate' = 3 if `varlist' >= 1300 & `varlist' <= 1300
		qui replace `generate' = 3 if `varlist' >= 1310 & `varlist' <= 1319
		qui replace `generate' = 3 if `varlist' >= 1320 & `varlist' <= 1329
		qui replace `generate' = 3 if `varlist' >= 1380 & `varlist' <= 1380
		qui replace `generate' = 3 if `varlist' >= 1381 & `varlist' <= 1381
		qui replace `generate' = 3 if `varlist' >= 1382 & `varlist' <= 1382
		qui replace `generate' = 3 if `varlist' >= 1389 & `varlist' <= 1389
		qui replace `generate' = 3 if `varlist' >= 2900 & `varlist' <= 2912
		qui replace `generate' = 3 if `varlist' >= 5170 & `varlist' <= 5172
		
		qui replace `generate' = 4 if `varlist' >= 2200 & `varlist' <= 2269
		qui replace `generate' = 4 if `varlist' >= 2270 & `varlist' <= 2279
		qui replace `generate' = 4 if `varlist' >= 2280 & `varlist' <= 2284
		qui replace `generate' = 4 if `varlist' >= 2290 & `varlist' <= 2295
		qui replace `generate' = 4 if `varlist' >= 2296 & `varlist' <= 2296
		qui replace `generate' = 4 if `varlist' >= 2297 & `varlist' <= 2297
		qui replace `generate' = 4 if `varlist' >= 2298 & `varlist' <= 2298
		qui replace `generate' = 4 if `varlist' >= 2299 & `varlist' <= 2299
		qui replace `generate' = 4 if `varlist' >= 2300 & `varlist' <= 2390
		qui replace `generate' = 4 if `varlist' >= 2391 & `varlist' <= 2392
		qui replace `generate' = 4 if `varlist' >= 2393 & `varlist' <= 2395
		qui replace `generate' = 4 if `varlist' >= 2396 & `varlist' <= 2396
		qui replace `generate' = 4 if `varlist' >= 2397 & `varlist' <= 2399
		qui replace `generate' = 4 if `varlist' >= 3020 & `varlist' <= 3021
		qui replace `generate' = 4 if `varlist' >= 3100 & `varlist' <= 3111
		qui replace `generate' = 4 if `varlist' >= 3130 & `varlist' <= 3131
		qui replace `generate' = 4 if `varlist' >= 3140 & `varlist' <= 3149
		qui replace `generate' = 4 if `varlist' >= 3150 & `varlist' <= 3151
		qui replace `generate' = 4 if `varlist' >= 3963 & `varlist' <= 3965
		qui replace `generate' = 4 if `varlist' >= 5130 & `varlist' <= 5139
		
		qui replace `generate' = 5 if `varlist' >= 2510 & `varlist' <= 2519
		qui replace `generate' = 5 if `varlist' >= 2590 & `varlist' <= 2599
		qui replace `generate' = 5 if `varlist' >= 3060 & `varlist' <= 3069
		qui replace `generate' = 5 if `varlist' >= 3070 & `varlist' <= 3079
		qui replace `generate' = 5 if `varlist' >= 3080 & `varlist' <= 3089
		qui replace `generate' = 5 if `varlist' >= 3090 & `varlist' <= 3099
		qui replace `generate' = 5 if `varlist' >= 3630 & `varlist' <= 3639
		qui replace `generate' = 5 if `varlist' >= 3650 & `varlist' <= 3651
		qui replace `generate' = 5 if `varlist' >= 3652 & `varlist' <= 3652
		qui replace `generate' = 5 if `varlist' >= 3860 & `varlist' <= 3861
		qui replace `generate' = 5 if `varlist' >= 3870 & `varlist' <= 3873
		qui replace `generate' = 5 if `varlist' >= 3910 & `varlist' <= 3911
		qui replace `generate' = 5 if `varlist' >= 3914 & `varlist' <= 3914
		qui replace `generate' = 5 if `varlist' >= 3915 & `varlist' <= 3915
		qui replace `generate' = 5 if `varlist' >= 3930 & `varlist' <= 3931
		qui replace `generate' = 5 if `varlist' >= 3940 & `varlist' <= 3949
		qui replace `generate' = 5 if `varlist' >= 3960 & `varlist' <= 3962
		qui replace `generate' = 5 if `varlist' >= 5020 & `varlist' <= 5023
		qui replace `generate' = 5 if `varlist' >= 5064 & `varlist' <= 5064
		qui replace `generate' = 5 if `varlist' >= 5094 & `varlist' <= 5094
		qui replace `generate' = 5 if `varlist' >= 5099 & `varlist' <= 5099
		
		qui replace `generate' = 6 if `varlist' >= 2800 & `varlist' <= 2809
		qui replace `generate' = 6 if `varlist' >= 2810 & `varlist' <= 2819
		qui replace `generate' = 6 if `varlist' >= 2820 & `varlist' <= 2829
		qui replace `generate' = 6 if `varlist' >= 2860 & `varlist' <= 2869
		qui replace `generate' = 6 if `varlist' >= 2870 & `varlist' <= 2879
		qui replace `generate' = 6 if `varlist' >= 2890 & `varlist' <= 2899
		qui replace `generate' = 6 if `varlist' >= 5160 & `varlist' <= 5169
		
		qui replace `generate' = 7 if `varlist' >= 2100 & `varlist' <= 2199
		qui replace `generate' = 7 if `varlist' >= 2830 & `varlist' <= 2830
		qui replace `generate' = 7 if `varlist' >= 2831 & `varlist' <= 2831
		qui replace `generate' = 7 if `varlist' >= 2833 & `varlist' <= 2833
		qui replace `generate' = 7 if `varlist' >= 2834 & `varlist' <= 2834
		qui replace `generate' = 7 if `varlist' >= 2840 & `varlist' <= 2843
		qui replace `generate' = 7 if `varlist' >= 2844 & `varlist' <= 2844
		qui replace `generate' = 7 if `varlist' >= 5120 & `varlist' <= 5122
		qui replace `generate' = 7 if `varlist' >= 5194 & `varlist' <= 5194
		
		qui replace `generate' = 8 if `varlist' >= 0800 & `varlist' <= 0899
		qui replace `generate' = 8 if `varlist' >= 1500 & `varlist' <= 1511
		qui replace `generate' = 8 if `varlist' >= 1520 & `varlist' <= 1529
		qui replace `generate' = 8 if `varlist' >= 1530 & `varlist' <= 1539
		qui replace `generate' = 8 if `varlist' >= 1540 & `varlist' <= 1549
		qui replace `generate' = 8 if `varlist' >= 1600 & `varlist' <= 1699
		qui replace `generate' = 8 if `varlist' >= 1700 & `varlist' <= 1799
		qui replace `generate' = 8 if `varlist' >= 2400 & `varlist' <= 2439
		qui replace `generate' = 8 if `varlist' >= 2440 & `varlist' <= 2449
		qui replace `generate' = 8 if `varlist' >= 2450 & `varlist' <= 2459
		qui replace `generate' = 8 if `varlist' >= 2490 & `varlist' <= 2499
		qui replace `generate' = 8 if `varlist' >= 2850 & `varlist' <= 2859
		qui replace `generate' = 8 if `varlist' >= 2950 & `varlist' <= 2952
		qui replace `generate' = 8 if `varlist' >= 3200 & `varlist' <= 3200
		qui replace `generate' = 8 if `varlist' >= 3210 & `varlist' <= 3211
		qui replace `generate' = 8 if `varlist' >= 3240 & `varlist' <= 3241
		qui replace `generate' = 8 if `varlist' >= 3250 & `varlist' <= 3259
		qui replace `generate' = 8 if `varlist' >= 3261 & `varlist' <= 3261
		qui replace `generate' = 8 if `varlist' >= 3264 & `varlist' <= 3264
		qui replace `generate' = 8 if `varlist' >= 3270 & `varlist' <= 3275
		qui replace `generate' = 8 if `varlist' >= 3280 & `varlist' <= 3281
		qui replace `generate' = 8 if `varlist' >= 3290 & `varlist' <= 3293
		qui replace `generate' = 8 if `varlist' >= 3420 & `varlist' <= 3429
		qui replace `generate' = 8 if `varlist' >= 3430 & `varlist' <= 3433
		qui replace `generate' = 8 if `varlist' >= 3440 & `varlist' <= 3441
		qui replace `generate' = 8 if `varlist' >= 3442 & `varlist' <= 3442
		qui replace `generate' = 8 if `varlist' >= 3446 & `varlist' <= 3446
		qui replace `generate' = 8 if `varlist' >= 3448 & `varlist' <= 3448
		qui replace `generate' = 8 if `varlist' >= 3449 & `varlist' <= 3449
		qui replace `generate' = 8 if `varlist' >= 3450 & `varlist' <= 3451
		qui replace `generate' = 8 if `varlist' >= 3452 & `varlist' <= 3452
		qui replace `generate' = 8 if `varlist' >= 5030 & `varlist' <= 5039
		qui replace `generate' = 8 if `varlist' >= 5070 & `varlist' <= 5078
		qui replace `generate' = 8 if `varlist' >= 5198 & `varlist' <= 5198
		qui replace `generate' = 8 if `varlist' >= 5210 & `varlist' <= 5211
		qui replace `generate' = 8 if `varlist' >= 5230 & `varlist' <= 5231
		qui replace `generate' = 8 if `varlist' >= 5250 & `varlist' <= 5251
		
		qui replace `generate' = 9 if `varlist' >= 3300 & `varlist' <= 3300
		qui replace `generate' = 9 if `varlist' >= 3310 & `varlist' <= 3317
		qui replace `generate' = 9 if `varlist' >= 3320 & `varlist' <= 3325
		qui replace `generate' = 9 if `varlist' >= 3330 & `varlist' <= 3339
		qui replace `generate' = 9 if `varlist' >= 3340 & `varlist' <= 3341
		qui replace `generate' = 9 if `varlist' >= 3350 & `varlist' <= 3357
		qui replace `generate' = 9 if `varlist' >= 3360 & `varlist' <= 3369
		qui replace `generate' = 9 if `varlist' >= 3390 & `varlist' <= 3399
		
		qui replace `generate' = 10 if `varlist' >= 3410 & `varlist' <= 3412
		qui replace `generate' = 10 if `varlist' >= 3443 & `varlist' <= 3443
		qui replace `generate' = 10 if `varlist' >= 3444 & `varlist' <= 3444
		qui replace `generate' = 10 if `varlist' >= 3460 & `varlist' <= 3469
		qui replace `generate' = 10 if `varlist' >= 3470 & `varlist' <= 3479
		qui replace `generate' = 10 if `varlist' >= 3480 & `varlist' <= 3489
		qui replace `generate' = 10 if `varlist' >= 3490 & `varlist' <= 3499
		
		qui replace `generate' = 11 if `varlist' >= 3510 & `varlist' <= 3519
		qui replace `generate' = 11 if `varlist' >= 3520 & `varlist' <= 3529
		qui replace `generate' = 11 if `varlist' >= 3530 & `varlist' <= 3530
		qui replace `generate' = 11 if `varlist' >= 3531 & `varlist' <= 3531
		qui replace `generate' = 11 if `varlist' >= 3532 & `varlist' <= 3532
		qui replace `generate' = 11 if `varlist' >= 3533 & `varlist' <= 3533
		qui replace `generate' = 11 if `varlist' >= 3534 & `varlist' <= 3534
		qui replace `generate' = 11 if `varlist' >= 3535 & `varlist' <= 3535
		qui replace `generate' = 11 if `varlist' >= 3536 & `varlist' <= 3536
		qui replace `generate' = 11 if `varlist' >= 3540 & `varlist' <= 3549
		qui replace `generate' = 11 if `varlist' >= 3550 & `varlist' <= 3559
		qui replace `generate' = 11 if `varlist' >= 3560 & `varlist' <= 3569
		qui replace `generate' = 11 if `varlist' >= 3570 & `varlist' <= 3579
		qui replace `generate' = 11 if `varlist' >= 3580 & `varlist' <= 3580
		qui replace `generate' = 11 if `varlist' >= 3581 & `varlist' <= 3581
		qui replace `generate' = 11 if `varlist' >= 3582 & `varlist' <= 3582
		qui replace `generate' = 11 if `varlist' >= 3585 & `varlist' <= 3585
		qui replace `generate' = 11 if `varlist' >= 3586 & `varlist' <= 3586
		qui replace `generate' = 11 if `varlist' >= 3589 & `varlist' <= 3589
		qui replace `generate' = 11 if `varlist' >= 3590 & `varlist' <= 3599
		qui replace `generate' = 11 if `varlist' >= 3600 & `varlist' <= 3600
		qui replace `generate' = 11 if `varlist' >= 3610 & `varlist' <= 3613
		qui replace `generate' = 11 if `varlist' >= 3620 & `varlist' <= 3621
		qui replace `generate' = 11 if `varlist' >= 3622 & `varlist' <= 3622
		qui replace `generate' = 11 if `varlist' >= 3623 & `varlist' <= 3629
		qui replace `generate' = 11 if `varlist' >= 3670 & `varlist' <= 3679
		qui replace `generate' = 11 if `varlist' >= 3680 & `varlist' <= 3680
		qui replace `generate' = 11 if `varlist' >= 3681 & `varlist' <= 3681
		qui replace `generate' = 11 if `varlist' >= 3682 & `varlist' <= 3682
		qui replace `generate' = 11 if `varlist' >= 3683 & `varlist' <= 3683
		qui replace `generate' = 11 if `varlist' >= 3684 & `varlist' <= 3684
		qui replace `generate' = 11 if `varlist' >= 3685 & `varlist' <= 3685
		qui replace `generate' = 11 if `varlist' >= 3686 & `varlist' <= 3686
		qui replace `generate' = 11 if `varlist' >= 3687 & `varlist' <= 3687
		qui replace `generate' = 11 if `varlist' >= 3688 & `varlist' <= 3688
		qui replace `generate' = 11 if `varlist' >= 3689 & `varlist' <= 3689
		qui replace `generate' = 11 if `varlist' >= 3690 & `varlist' <= 3690
		qui replace `generate' = 11 if `varlist' >= 3691 & `varlist' <= 3692
		qui replace `generate' = 11 if `varlist' >= 3693 & `varlist' <= 3693
		qui replace `generate' = 11 if `varlist' >= 3694 & `varlist' <= 3694
		qui replace `generate' = 11 if `varlist' >= 3695 & `varlist' <= 3695
		qui replace `generate' = 11 if `varlist' >= 3699 & `varlist' <= 3699
		qui replace `generate' = 11 if `varlist' >= 3810 & `varlist' <= 3810
		qui replace `generate' = 11 if `varlist' >= 3811 & `varlist' <= 3811
		qui replace `generate' = 11 if `varlist' >= 3812 & `varlist' <= 3812
		qui replace `generate' = 11 if `varlist' >= 3820 & `varlist' <= 3820
		qui replace `generate' = 11 if `varlist' >= 3821 & `varlist' <= 3821
		qui replace `generate' = 11 if `varlist' >= 3822 & `varlist' <= 3822
		qui replace `generate' = 11 if `varlist' >= 3823 & `varlist' <= 3823
		qui replace `generate' = 11 if `varlist' >= 3824 & `varlist' <= 3824
		qui replace `generate' = 11 if `varlist' >= 3825 & `varlist' <= 3825
		qui replace `generate' = 11 if `varlist' >= 3826 & `varlist' <= 3826
		qui replace `generate' = 11 if `varlist' >= 3827 & `varlist' <= 3827
		qui replace `generate' = 11 if `varlist' >= 3829 & `varlist' <= 3829
		qui replace `generate' = 11 if `varlist' >= 3830 & `varlist' <= 3839
		qui replace `generate' = 11 if `varlist' >= 3950 & `varlist' <= 3955
		qui replace `generate' = 11 if `varlist' >= 5060 & `varlist' <= 5060
		qui replace `generate' = 11 if `varlist' >= 5063 & `varlist' <= 5063
		qui replace `generate' = 11 if `varlist' >= 5065 & `varlist' <= 5065
		qui replace `generate' = 11 if `varlist' >= 5080 & `varlist' <= 5080
		qui replace `generate' = 11 if `varlist' >= 5081 & `varlist' <= 5081
		
		qui replace `generate' = 12 if `varlist' >= 3710 & `varlist' <= 3710
		qui replace `generate' = 12 if `varlist' >= 3711 & `varlist' <= 3711
		qui replace `generate' = 12 if `varlist' >= 3714 & `varlist' <= 3714
		qui replace `generate' = 12 if `varlist' >= 3716 & `varlist' <= 3716
		qui replace `generate' = 12 if `varlist' >= 3750 & `varlist' <= 3751
		qui replace `generate' = 12 if `varlist' >= 3792 & `varlist' <= 3792
		qui replace `generate' = 12 if `varlist' >= 5010 & `varlist' <= 5015
		qui replace `generate' = 12 if `varlist' >= 5510 & `varlist' <= 5521
		qui replace `generate' = 12 if `varlist' >= 5530 & `varlist' <= 5531
		qui replace `generate' = 12 if `varlist' >= 5560 & `varlist' <= 5561
		qui replace `generate' = 12 if `varlist' >= 5570 & `varlist' <= 5571
		qui replace `generate' = 12 if `varlist' >= 5590 & `varlist' <= 5599
		
		qui replace `generate' = 13 if `varlist' >= 3713 & `varlist' <= 3713
		qui replace `generate' = 13 if `varlist' >= 3715 & `varlist' <= 3715
		qui replace `generate' = 13 if `varlist' >= 3720 & `varlist' <= 3720
		qui replace `generate' = 13 if `varlist' >= 3721 & `varlist' <= 3721
		qui replace `generate' = 13 if `varlist' >= 3724 & `varlist' <= 3724
		qui replace `generate' = 13 if `varlist' >= 3725 & `varlist' <= 3725
		qui replace `generate' = 13 if `varlist' >= 3728 & `varlist' <= 3728
		qui replace `generate' = 13 if `varlist' >= 3730 & `varlist' <= 3731
		qui replace `generate' = 13 if `varlist' >= 3732 & `varlist' <= 3732
		qui replace `generate' = 13 if `varlist' >= 3740 & `varlist' <= 3743
		qui replace `generate' = 13 if `varlist' >= 3760 & `varlist' <= 3769
		qui replace `generate' = 13 if `varlist' >= 3790 & `varlist' <= 3790
		qui replace `generate' = 13 if `varlist' >= 3795 & `varlist' <= 3795
		qui replace `generate' = 13 if `varlist' >= 3799 & `varlist' <= 3799
		qui replace `generate' = 13 if `varlist' >= 4000 & `varlist' <= 4013
		qui replace `generate' = 13 if `varlist' >= 4100 & `varlist' <= 4100
		qui replace `generate' = 13 if `varlist' >= 4110 & `varlist' <= 4119
		qui replace `generate' = 13 if `varlist' >= 4120 & `varlist' <= 4121
		qui replace `generate' = 13 if `varlist' >= 4130 & `varlist' <= 4131
		qui replace `generate' = 13 if `varlist' >= 4140 & `varlist' <= 4142
		qui replace `generate' = 13 if `varlist' >= 4150 & `varlist' <= 4151
		qui replace `generate' = 13 if `varlist' >= 4170 & `varlist' <= 4173
		qui replace `generate' = 13 if `varlist' >= 4190 & `varlist' <= 4199
		qui replace `generate' = 13 if `varlist' >= 4200 & `varlist' <= 4200
		qui replace `generate' = 13 if `varlist' >= 4210 & `varlist' <= 4219
		qui replace `generate' = 13 if `varlist' >= 4220 & `varlist' <= 4229
		qui replace `generate' = 13 if `varlist' >= 4230 & `varlist' <= 4231
		qui replace `generate' = 13 if `varlist' >= 4400 & `varlist' <= 4499
		qui replace `generate' = 13 if `varlist' >= 4500 & `varlist' <= 4599
		qui replace `generate' = 13 if `varlist' >= 4600 & `varlist' <= 4699
		qui replace `generate' = 13 if `varlist' >= 4700 & `varlist' <= 4700
		qui replace `generate' = 13 if `varlist' >= 4710 & `varlist' <= 4712
		qui replace `generate' = 13 if `varlist' >= 4720 & `varlist' <= 4729
		qui replace `generate' = 13 if `varlist' >= 4730 & `varlist' <= 4739
		qui replace `generate' = 13 if `varlist' >= 4740 & `varlist' <= 4742
		qui replace `generate' = 13 if `varlist' >= 4780 & `varlist' <= 4780
		qui replace `generate' = 13 if `varlist' >= 4783 & `varlist' <= 4783
		qui replace `generate' = 13 if `varlist' >= 4785 & `varlist' <= 4785
		qui replace `generate' = 13 if `varlist' >= 4789 & `varlist' <= 4789
		
		qui replace `generate' = 14 if `varlist' >= 4900 & `varlist' <= 4900
		qui replace `generate' = 14 if `varlist' >= 4910 & `varlist' <= 4911
		qui replace `generate' = 14 if `varlist' >= 4920 & `varlist' <= 4922
		qui replace `generate' = 14 if `varlist' >= 4923 & `varlist' <= 4923
		qui replace `generate' = 14 if `varlist' >= 4924 & `varlist' <= 4925
		qui replace `generate' = 14 if `varlist' >= 4930 & `varlist' <= 4931
		qui replace `generate' = 14 if `varlist' >= 4932 & `varlist' <= 4932
		qui replace `generate' = 14 if `varlist' >= 4939 & `varlist' <= 4939
		qui replace `generate' = 14 if `varlist' >= 4940 & `varlist' <= 4942
		
		qui replace `generate' = 15 if `varlist' >= 5260 & `varlist' <= 5261
		qui replace `generate' = 15 if `varlist' >= 5270 & `varlist' <= 5271
		qui replace `generate' = 15 if `varlist' >= 5300 & `varlist' <= 5300
		qui replace `generate' = 15 if `varlist' >= 5310 & `varlist' <= 5311
		qui replace `generate' = 15 if `varlist' >= 5320 & `varlist' <= 5320
		qui replace `generate' = 15 if `varlist' >= 5330 & `varlist' <= 5331
		qui replace `generate' = 15 if `varlist' >= 5334 & `varlist' <= 5334
		qui replace `generate' = 15 if `varlist' >= 5390 & `varlist' <= 5399
		qui replace `generate' = 15 if `varlist' >= 5400 & `varlist' <= 5400
		qui replace `generate' = 15 if `varlist' >= 5410 & `varlist' <= 5411
		qui replace `generate' = 15 if `varlist' >= 5412 & `varlist' <= 5412
		qui replace `generate' = 15 if `varlist' >= 5420 & `varlist' <= 5421
		qui replace `generate' = 15 if `varlist' >= 5430 & `varlist' <= 5431
		qui replace `generate' = 15 if `varlist' >= 5440 & `varlist' <= 5441
		qui replace `generate' = 15 if `varlist' >= 5450 & `varlist' <= 5451
		qui replace `generate' = 15 if `varlist' >= 5460 & `varlist' <= 5461
		qui replace `generate' = 15 if `varlist' >= 5490 & `varlist' <= 5499
		qui replace `generate' = 15 if `varlist' >= 5540 & `varlist' <= 5541
		qui replace `generate' = 15 if `varlist' >= 5550 & `varlist' <= 5551
		qui replace `generate' = 15 if `varlist' >= 5600 & `varlist' <= 5699
		qui replace `generate' = 15 if `varlist' >= 5700 & `varlist' <= 5700
		qui replace `generate' = 15 if `varlist' >= 5710 & `varlist' <= 5719
		qui replace `generate' = 15 if `varlist' >= 5720 & `varlist' <= 5722
		qui replace `generate' = 15 if `varlist' >= 5730 & `varlist' <= 5733
		qui replace `generate' = 15 if `varlist' >= 5734 & `varlist' <= 5734
		qui replace `generate' = 15 if `varlist' >= 5735 & `varlist' <= 5735
		qui replace `generate' = 15 if `varlist' >= 5736 & `varlist' <= 5736
		qui replace `generate' = 15 if `varlist' >= 5750 & `varlist' <= 5750
		qui replace `generate' = 15 if `varlist' >= 5800 & `varlist' <= 5813
		qui replace `generate' = 15 if `varlist' >= 5890 & `varlist' <= 5890
		qui replace `generate' = 15 if `varlist' >= 5900 & `varlist' <= 5900
		qui replace `generate' = 15 if `varlist' >= 5910 & `varlist' <= 5912
		qui replace `generate' = 15 if `varlist' >= 5920 & `varlist' <= 5921
		qui replace `generate' = 15 if `varlist' >= 5930 & `varlist' <= 5932
		qui replace `generate' = 15 if `varlist' >= 5940 & `varlist' <= 5940
		qui replace `generate' = 15 if `varlist' >= 5941 & `varlist' <= 5941
		qui replace `generate' = 15 if `varlist' >= 5942 & `varlist' <= 5942
		qui replace `generate' = 15 if `varlist' >= 5943 & `varlist' <= 5943
		qui replace `generate' = 15 if `varlist' >= 5944 & `varlist' <= 5944
		qui replace `generate' = 15 if `varlist' >= 5945 & `varlist' <= 5945
		qui replace `generate' = 15 if `varlist' >= 5946 & `varlist' <= 5946
		qui replace `generate' = 15 if `varlist' >= 5947 & `varlist' <= 5947
		qui replace `generate' = 15 if `varlist' >= 5948 & `varlist' <= 5948
		qui replace `generate' = 15 if `varlist' >= 5949 & `varlist' <= 5949
		qui replace `generate' = 15 if `varlist' >= 5960 & `varlist' <= 5963
		qui replace `generate' = 15 if `varlist' >= 5980 & `varlist' <= 5989
		qui replace `generate' = 15 if `varlist' >= 5990 & `varlist' <= 5990
		qui replace `generate' = 15 if `varlist' >= 5992 & `varlist' <= 5992
		qui replace `generate' = 15 if `varlist' >= 5993 & `varlist' <= 5993
		qui replace `generate' = 15 if `varlist' >= 5994 & `varlist' <= 5994
		qui replace `generate' = 15 if `varlist' >= 5995 & `varlist' <= 5995
		qui replace `generate' = 15 if `varlist' >= 5999 & `varlist' <= 5999
		
		qui replace `generate' = 16 if `varlist' >= 6010 & `varlist' <= 6019
		qui replace `generate' = 16 if `varlist' >= 6020 & `varlist' <= 6020
		qui replace `generate' = 16 if `varlist' >= 6021 & `varlist' <= 6021
		qui replace `generate' = 16 if `varlist' >= 6022 & `varlist' <= 6022
		qui replace `generate' = 16 if `varlist' >= 6023 & `varlist' <= 6023
		qui replace `generate' = 16 if `varlist' >= 6025 & `varlist' <= 6025
		qui replace `generate' = 16 if `varlist' >= 6026 & `varlist' <= 6026
		qui replace `generate' = 16 if `varlist' >= 6028 & `varlist' <= 6029
		qui replace `generate' = 16 if `varlist' >= 6030 & `varlist' <= 6036
		qui replace `generate' = 16 if `varlist' >= 6040 & `varlist' <= 6049
		qui replace `generate' = 16 if `varlist' >= 6050 & `varlist' <= 6059
		qui replace `generate' = 16 if `varlist' >= 6060 & `varlist' <= 6062
		qui replace `generate' = 16 if `varlist' >= 6080 & `varlist' <= 6082
		qui replace `generate' = 16 if `varlist' >= 6090 & `varlist' <= 6099
		qui replace `generate' = 16 if `varlist' >= 6100 & `varlist' <= 6100
		qui replace `generate' = 16 if `varlist' >= 6110 & `varlist' <= 6111
		qui replace `generate' = 16 if `varlist' >= 6112 & `varlist' <= 6112
		qui replace `generate' = 16 if `varlist' >= 6120 & `varlist' <= 6129
		qui replace `generate' = 16 if `varlist' >= 6140 & `varlist' <= 6149
		qui replace `generate' = 16 if `varlist' >= 6150 & `varlist' <= 6159
		qui replace `generate' = 16 if `varlist' >= 6160 & `varlist' <= 6163
		qui replace `generate' = 16 if `varlist' >= 6172 & `varlist' <= 6172
		qui replace `generate' = 16 if `varlist' >= 6199 & `varlist' <= 6199
		qui replace `generate' = 16 if `varlist' >= 6200 & `varlist' <= 6299
		qui replace `generate' = 16 if `varlist' >= 6300 & `varlist' <= 6300
		qui replace `generate' = 16 if `varlist' >= 6310 & `varlist' <= 6312
		qui replace `generate' = 16 if `varlist' >= 6320 & `varlist' <= 6324
		qui replace `generate' = 16 if `varlist' >= 6330 & `varlist' <= 6331
		qui replace `generate' = 16 if `varlist' >= 6350 & `varlist' <= 6351
		qui replace `generate' = 16 if `varlist' >= 6360 & `varlist' <= 6361
		qui replace `generate' = 16 if `varlist' >= 6370 & `varlist' <= 6371
		qui replace `generate' = 16 if `varlist' >= 6390 & `varlist' <= 6399
		qui replace `generate' = 16 if `varlist' >= 6400 & `varlist' <= 6411
		qui replace `generate' = 16 if `varlist' >= 6500 & `varlist' <= 6500
		qui replace `generate' = 16 if `varlist' >= 6510 & `varlist' <= 6510
		qui replace `generate' = 16 if `varlist' >= 6512 & `varlist' <= 6512
		qui replace `generate' = 16 if `varlist' >= 6513 & `varlist' <= 6513
		qui replace `generate' = 16 if `varlist' >= 6514 & `varlist' <= 6514
		qui replace `generate' = 16 if `varlist' >= 6515 & `varlist' <= 6515
		qui replace `generate' = 16 if `varlist' >= 6517 & `varlist' <= 6519
		qui replace `generate' = 16 if `varlist' >= 6530 & `varlist' <= 6531
		qui replace `generate' = 16 if `varlist' >= 6532 & `varlist' <= 6532
		qui replace `generate' = 16 if `varlist' >= 6540 & `varlist' <= 6541
		qui replace `generate' = 16 if `varlist' >= 6550 & `varlist' <= 6553
		qui replace `generate' = 16 if `varlist' >= 6611 & `varlist' <= 6611
		qui replace `generate' = 16 if `varlist' >= 6700 & `varlist' <= 6700
		qui replace `generate' = 16 if `varlist' >= 6710 & `varlist' <= 6719
		qui replace `generate' = 16 if `varlist' >= 6720 & `varlist' <= 6722
		qui replace `generate' = 16 if `varlist' >= 6723 & `varlist' <= 6723
		qui replace `generate' = 16 if `varlist' >= 6724 & `varlist' <= 6724
		qui replace `generate' = 16 if `varlist' >= 6725 & `varlist' <= 6725
		qui replace `generate' = 16 if `varlist' >= 6726 & `varlist' <= 6726
		qui replace `generate' = 16 if `varlist' >= 6730 & `varlist' <= 6733
		qui replace `generate' = 16 if `varlist' >= 6790 & `varlist' <= 6790
		qui replace `generate' = 16 if `varlist' >= 6792 & `varlist' <= 6792
		qui replace `generate' = 16 if `varlist' >= 6794 & `varlist' <= 6794
		qui replace `generate' = 16 if `varlist' >= 6795 & `varlist' <= 6795
		qui replace `generate' = 16 if `varlist' >= 6798 & `varlist' <= 6798
		qui replace `generate' = 16 if `varlist' >= 6799 & `varlist' <= 6799
		
		qui replace `generate' = 17 if `varlist' >= 2520 & `varlist' <= 2549
		qui replace `generate' = 17 if `varlist' >= 2600 & `varlist' <= 2639
		qui replace `generate' = 17 if `varlist' >= 2640 & `varlist' <= 2659
		qui replace `generate' = 17 if `varlist' >= 2661 & `varlist' <= 2661
		qui replace `generate' = 17 if `varlist' >= 2670 & `varlist' <= 2699
		qui replace `generate' = 17 if `varlist' >= 2700 & `varlist' <= 2709
		qui replace `generate' = 17 if `varlist' >= 2710 & `varlist' <= 2719
		qui replace `generate' = 17 if `varlist' >= 2720 & `varlist' <= 2729
		qui replace `generate' = 17 if `varlist' >= 2730 & `varlist' <= 2739
		qui replace `generate' = 17 if `varlist' >= 2740 & `varlist' <= 2749
		qui replace `generate' = 17 if `varlist' >= 2750 & `varlist' <= 2759
		qui replace `generate' = 17 if `varlist' >= 2760 & `varlist' <= 2761
		qui replace `generate' = 17 if `varlist' >= 2770 & `varlist' <= 2771
		qui replace `generate' = 17 if `varlist' >= 2780 & `varlist' <= 2789
		qui replace `generate' = 17 if `varlist' >= 2790 & `varlist' <= 2799
		qui replace `generate' = 17 if `varlist' >= 2835 & `varlist' <= 2835
		qui replace `generate' = 17 if `varlist' >= 2836 & `varlist' <= 2836
		qui replace `generate' = 17 if `varlist' >= 2990 & `varlist' <= 2999
		qui replace `generate' = 17 if `varlist' >= 3000 & `varlist' <= 3000
		qui replace `generate' = 17 if `varlist' >= 3010 & `varlist' <= 3011
		qui replace `generate' = 17 if `varlist' >= 3041 & `varlist' <= 3041
		qui replace `generate' = 17 if `varlist' >= 3050 & `varlist' <= 3053
		qui replace `generate' = 17 if `varlist' >= 3160 & `varlist' <= 3161
		qui replace `generate' = 17 if `varlist' >= 3170 & `varlist' <= 3171
		qui replace `generate' = 17 if `varlist' >= 3172 & `varlist' <= 3172
		qui replace `generate' = 17 if `varlist' >= 3190 & `varlist' <= 3199
		qui replace `generate' = 17 if `varlist' >= 3220 & `varlist' <= 3221
		qui replace `generate' = 17 if `varlist' >= 3229 & `varlist' <= 3229
		qui replace `generate' = 17 if `varlist' >= 3230 & `varlist' <= 3231
		qui replace `generate' = 17 if `varlist' >= 3260 & `varlist' <= 3260
		qui replace `generate' = 17 if `varlist' >= 3262 & `varlist' <= 3263
		qui replace `generate' = 17 if `varlist' >= 3269 & `varlist' <= 3269
		qui replace `generate' = 17 if `varlist' >= 3295 & `varlist' <= 3299
		qui replace `generate' = 17 if `varlist' >= 3537 & `varlist' <= 3537
		qui replace `generate' = 17 if `varlist' >= 3640 & `varlist' <= 3644
		qui replace `generate' = 17 if `varlist' >= 3645 & `varlist' <= 3645
		qui replace `generate' = 17 if `varlist' >= 3646 & `varlist' <= 3646
		qui replace `generate' = 17 if `varlist' >= 3647 & `varlist' <= 3647
		qui replace `generate' = 17 if `varlist' >= 3648 & `varlist' <= 3649
		qui replace `generate' = 17 if `varlist' >= 3660 & `varlist' <= 3660
		qui replace `generate' = 17 if `varlist' >= 3661 & `varlist' <= 3661
		qui replace `generate' = 17 if `varlist' >= 3662 & `varlist' <= 3662
		qui replace `generate' = 17 if `varlist' >= 3663 & `varlist' <= 3663
		qui replace `generate' = 17 if `varlist' >= 3664 & `varlist' <= 3664
		qui replace `generate' = 17 if `varlist' >= 3665 & `varlist' <= 3665
		qui replace `generate' = 17 if `varlist' >= 3666 & `varlist' <= 3666
		qui replace `generate' = 17 if `varlist' >= 3669 & `varlist' <= 3669
		qui replace `generate' = 17 if `varlist' >= 3840 & `varlist' <= 3849
		qui replace `generate' = 17 if `varlist' >= 3850 & `varlist' <= 3851
		qui replace `generate' = 17 if `varlist' >= 3991 & `varlist' <= 3991
		qui replace `generate' = 17 if `varlist' >= 3993 & `varlist' <= 3993
		qui replace `generate' = 17 if `varlist' >= 3995 & `varlist' <= 3995
		qui replace `generate' = 17 if `varlist' >= 3996 & `varlist' <= 3996
		qui replace `generate' = 17 if `varlist' >= 4810 & `varlist' <= 4813
		qui replace `generate' = 17 if `varlist' >= 4820 & `varlist' <= 4822
		qui replace `generate' = 17 if `varlist' >= 4830 & `varlist' <= 4839
		qui replace `generate' = 17 if `varlist' >= 4840 & `varlist' <= 4841
		qui replace `generate' = 17 if `varlist' >= 4890 & `varlist' <= 4890
		qui replace `generate' = 17 if `varlist' >= 4891 & `varlist' <= 4891
		qui replace `generate' = 17 if `varlist' >= 4892 & `varlist' <= 4892
		qui replace `generate' = 17 if `varlist' >= 4899 & `varlist' <= 4899
		qui replace `generate' = 17 if `varlist' >= 4950 & `varlist' <= 4959
		qui replace `generate' = 17 if `varlist' >= 4960 & `varlist' <= 4961
		qui replace `generate' = 17 if `varlist' >= 4970 & `varlist' <= 4971
		qui replace `generate' = 17 if `varlist' >= 4991 & `varlist' <= 4991
		qui replace `generate' = 17 if `varlist' >= 5040 & `varlist' <= 5042
		qui replace `generate' = 17 if `varlist' >= 5043 & `varlist' <= 5043
		qui replace `generate' = 17 if `varlist' >= 5044 & `varlist' <= 5044
		qui replace `generate' = 17 if `varlist' >= 5045 & `varlist' <= 5045
		qui replace `generate' = 17 if `varlist' >= 5046 & `varlist' <= 5046
		qui replace `generate' = 17 if `varlist' >= 5047 & `varlist' <= 5047
		qui replace `generate' = 17 if `varlist' >= 5048 & `varlist' <= 5048
		qui replace `generate' = 17 if `varlist' >= 5049 & `varlist' <= 5049
		qui replace `generate' = 17 if `varlist' >= 5082 & `varlist' <= 5082
		qui replace `generate' = 17 if `varlist' >= 5083 & `varlist' <= 5083
		qui replace `generate' = 17 if `varlist' >= 5084 & `varlist' <= 5084
		qui replace `generate' = 17 if `varlist' >= 5085 & `varlist' <= 5085
		qui replace `generate' = 17 if `varlist' >= 5086 & `varlist' <= 5087
		qui replace `generate' = 17 if `varlist' >= 5088 & `varlist' <= 5088
		qui replace `generate' = 17 if `varlist' >= 5090 & `varlist' <= 5090
		qui replace `generate' = 17 if `varlist' >= 5091 & `varlist' <= 5092
		qui replace `generate' = 17 if `varlist' >= 5093 & `varlist' <= 5093
		qui replace `generate' = 17 if `varlist' >= 5100 & `varlist' <= 5100
		qui replace `generate' = 17 if `varlist' >= 5110 & `varlist' <= 5113
		qui replace `generate' = 17 if `varlist' >= 5199 & `varlist' <= 5199
		qui replace `generate' = 17 if `varlist' >= 7000 & `varlist' <= 7000
		qui replace `generate' = 17 if `varlist' >= 7010 & `varlist' <= 7011
		qui replace `generate' = 17 if `varlist' >= 7020 & `varlist' <= 7021
		qui replace `generate' = 17 if `varlist' >= 7030 & `varlist' <= 7033
		qui replace `generate' = 17 if `varlist' >= 7040 & `varlist' <= 7041
		qui replace `generate' = 17 if `varlist' >= 7200 & `varlist' <= 7200
		qui replace `generate' = 17 if `varlist' >= 7210 & `varlist' <= 7212
		qui replace `generate' = 17 if `varlist' >= 7213 & `varlist' <= 7213
		qui replace `generate' = 17 if `varlist' >= 7215 & `varlist' <= 7216
		qui replace `generate' = 17 if `varlist' >= 7217 & `varlist' <= 7217
		qui replace `generate' = 17 if `varlist' >= 7218 & `varlist' <= 7218
		qui replace `generate' = 17 if `varlist' >= 7219 & `varlist' <= 7219
		qui replace `generate' = 17 if `varlist' >= 7220 & `varlist' <= 7221
		qui replace `generate' = 17 if `varlist' >= 7230 & `varlist' <= 7231
		qui replace `generate' = 17 if `varlist' >= 7240 & `varlist' <= 7241
		qui replace `generate' = 17 if `varlist' >= 7250 & `varlist' <= 7251
		qui replace `generate' = 17 if `varlist' >= 7260 & `varlist' <= 7269
		qui replace `generate' = 17 if `varlist' >= 7290 & `varlist' <= 7290
		qui replace `generate' = 17 if `varlist' >= 7291 & `varlist' <= 7291
		qui replace `generate' = 17 if `varlist' >= 7299 & `varlist' <= 7299
		qui replace `generate' = 17 if `varlist' >= 7300 & `varlist' <= 7300
		qui replace `generate' = 17 if `varlist' >= 7310 & `varlist' <= 7319
		qui replace `generate' = 17 if `varlist' >= 7320 & `varlist' <= 7323
		qui replace `generate' = 17 if `varlist' >= 7330 & `varlist' <= 7338
		qui replace `generate' = 17 if `varlist' >= 7340 & `varlist' <= 7342
		qui replace `generate' = 17 if `varlist' >= 7349 & `varlist' <= 7349
		qui replace `generate' = 17 if `varlist' >= 7350 & `varlist' <= 7351
		qui replace `generate' = 17 if `varlist' >= 7352 & `varlist' <= 7352
		qui replace `generate' = 17 if `varlist' >= 7353 & `varlist' <= 7353
		qui replace `generate' = 17 if `varlist' >= 7359 & `varlist' <= 7359
		qui replace `generate' = 17 if `varlist' >= 7360 & `varlist' <= 7369
		qui replace `generate' = 17 if `varlist' >= 7370 & `varlist' <= 7372
		qui replace `generate' = 17 if `varlist' >= 7373 & `varlist' <= 7373
		qui replace `generate' = 17 if `varlist' >= 7374 & `varlist' <= 7374
		qui replace `generate' = 17 if `varlist' >= 7375 & `varlist' <= 7375
		qui replace `generate' = 17 if `varlist' >= 7376 & `varlist' <= 7376
		qui replace `generate' = 17 if `varlist' >= 7377 & `varlist' <= 7377
		qui replace `generate' = 17 if `varlist' >= 7378 & `varlist' <= 7378
		qui replace `generate' = 17 if `varlist' >= 7379 & `varlist' <= 7379
		qui replace `generate' = 17 if `varlist' >= 7380 & `varlist' <= 7380
		qui replace `generate' = 17 if `varlist' >= 7381 & `varlist' <= 7382
		qui replace `generate' = 17 if `varlist' >= 7383 & `varlist' <= 7383
		qui replace `generate' = 17 if `varlist' >= 7384 & `varlist' <= 7384
		qui replace `generate' = 17 if `varlist' >= 7385 & `varlist' <= 7385
		qui replace `generate' = 17 if `varlist' >= 7389 & `varlist' <= 7390
		qui replace `generate' = 17 if `varlist' >= 7391 & `varlist' <= 7391
		qui replace `generate' = 17 if `varlist' >= 7392 & `varlist' <= 7392
		qui replace `generate' = 17 if `varlist' >= 7393 & `varlist' <= 7393
		qui replace `generate' = 17 if `varlist' >= 7394 & `varlist' <= 7394
		qui replace `generate' = 17 if `varlist' >= 7395 & `varlist' <= 7395
		qui replace `generate' = 17 if `varlist' >= 7397 & `varlist' <= 7397
		qui replace `generate' = 17 if `varlist' >= 7399 & `varlist' <= 7399
		qui replace `generate' = 17 if `varlist' >= 7500 & `varlist' <= 7500
		qui replace `generate' = 17 if `varlist' >= 7510 & `varlist' <= 7519
		qui replace `generate' = 17 if `varlist' >= 7520 & `varlist' <= 7523
		qui replace `generate' = 17 if `varlist' >= 7530 & `varlist' <= 7539
		qui replace `generate' = 17 if `varlist' >= 7540 & `varlist' <= 7549
		qui replace `generate' = 17 if `varlist' >= 7600 & `varlist' <= 7600
		qui replace `generate' = 17 if `varlist' >= 7620 & `varlist' <= 7620
		qui replace `generate' = 17 if `varlist' >= 7622 & `varlist' <= 7622
		qui replace `generate' = 17 if `varlist' >= 7623 & `varlist' <= 7623
		qui replace `generate' = 17 if `varlist' >= 7629 & `varlist' <= 7629
		qui replace `generate' = 17 if `varlist' >= 7630 & `varlist' <= 7631
		qui replace `generate' = 17 if `varlist' >= 7640 & `varlist' <= 7641
		qui replace `generate' = 17 if `varlist' >= 7690 & `varlist' <= 7699
		qui replace `generate' = 17 if `varlist' >= 7800 & `varlist' <= 7829
		qui replace `generate' = 17 if `varlist' >= 7830 & `varlist' <= 7833
		qui replace `generate' = 17 if `varlist' >= 7840 & `varlist' <= 7841
		qui replace `generate' = 17 if `varlist' >= 7900 & `varlist' <= 7900
		qui replace `generate' = 17 if `varlist' >= 7910 & `varlist' <= 7911
		qui replace `generate' = 17 if `varlist' >= 7920 & `varlist' <= 7929
		qui replace `generate' = 17 if `varlist' >= 7930 & `varlist' <= 7933
		qui replace `generate' = 17 if `varlist' >= 7940 & `varlist' <= 7949
		qui replace `generate' = 17 if `varlist' >= 7980 & `varlist' <= 7980
		qui replace `generate' = 17 if `varlist' >= 7990 & `varlist' <= 7999
		qui replace `generate' = 17 if `varlist' >= 8000 & `varlist' <= 8099
		qui replace `generate' = 17 if `varlist' >= 8100 & `varlist' <= 8199
		qui replace `generate' = 17 if `varlist' >= 8200 & `varlist' <= 8299
		qui replace `generate' = 17 if `varlist' >= 8300 & `varlist' <= 8399
		qui replace `generate' = 17 if `varlist' >= 8400 & `varlist' <= 8499
		qui replace `generate' = 17 if `varlist' >= 8600 & `varlist' <= 8699
		qui replace `generate' = 17 if `varlist' >= 8700 & `varlist' <= 8700
		qui replace `generate' = 17 if `varlist' >= 8710 & `varlist' <= 8713
		qui replace `generate' = 17 if `varlist' >= 8720 & `varlist' <= 8721
		qui replace `generate' = 17 if `varlist' >= 8730 & `varlist' <= 8734
		qui replace `generate' = 17 if `varlist' >= 8740 & `varlist' <= 8748
		qui replace `generate' = 17 if `varlist' >= 8800 & `varlist' <= 8899
		qui replace `generate' = 17 if `varlist' >= 8900 & `varlist' <= 8910
		qui replace `generate' = 17 if `varlist' >= 8911 & `varlist' <= 8911
		qui replace `generate' = 17 if `varlist' >= 8920 & `varlist' <= 8999
	}



	// Fama French 30 industry
	else if `industry' == 30 {
		qui replace `generate' = 1 if `varlist' >= 0100 & `varlist' <= 0199
		qui replace `generate' = 1 if `varlist' >= 0200 & `varlist' <= 0299
		qui replace `generate' = 1 if `varlist' >= 0700 & `varlist' <= 0799
		qui replace `generate' = 1 if `varlist' >= 0910 & `varlist' <= 0919
		qui replace `generate' = 1 if `varlist' >= 2000 & `varlist' <= 2009
		qui replace `generate' = 1 if `varlist' >= 2010 & `varlist' <= 2019
		qui replace `generate' = 1 if `varlist' >= 2020 & `varlist' <= 2029
		qui replace `generate' = 1 if `varlist' >= 2030 & `varlist' <= 2039
		qui replace `generate' = 1 if `varlist' >= 2040 & `varlist' <= 2046
		qui replace `generate' = 1 if `varlist' >= 2048 & `varlist' <= 2048
		qui replace `generate' = 1 if `varlist' >= 2050 & `varlist' <= 2059
		qui replace `generate' = 1 if `varlist' >= 2060 & `varlist' <= 2063
		qui replace `generate' = 1 if `varlist' >= 2064 & `varlist' <= 2068
		qui replace `generate' = 1 if `varlist' >= 2070 & `varlist' <= 2079
		qui replace `generate' = 1 if `varlist' >= 2086 & `varlist' <= 2086
		qui replace `generate' = 1 if `varlist' >= 2087 & `varlist' <= 2087
		qui replace `generate' = 1 if `varlist' >= 2090 & `varlist' <= 2092
		qui replace `generate' = 1 if `varlist' >= 2095 & `varlist' <= 2095
		qui replace `generate' = 1 if `varlist' >= 2096 & `varlist' <= 2096
		qui replace `generate' = 1 if `varlist' >= 2097 & `varlist' <= 2097
		qui replace `generate' = 1 if `varlist' >= 2098 & `varlist' <= 2099
		
		qui replace `generate' = 2 if `varlist' >= 2080 & `varlist' <= 2080
		qui replace `generate' = 2 if `varlist' >= 2082 & `varlist' <= 2082
		qui replace `generate' = 2 if `varlist' >= 2083 & `varlist' <= 2083
		qui replace `generate' = 2 if `varlist' >= 2084 & `varlist' <= 2084
		qui replace `generate' = 2 if `varlist' >= 2085 & `varlist' <= 2085
		
		qui replace `generate' = 3 if `varlist' >= 2100 & `varlist' <= 2199
		
		qui replace `generate' = 4 if `varlist' >= 0920 & `varlist' <= 0999
		qui replace `generate' = 4 if `varlist' >= 3650 & `varlist' <= 3651
		qui replace `generate' = 4 if `varlist' >= 3652 & `varlist' <= 3652
		qui replace `generate' = 4 if `varlist' >= 3732 & `varlist' <= 3732
		qui replace `generate' = 4 if `varlist' >= 3930 & `varlist' <= 3931
		qui replace `generate' = 4 if `varlist' >= 3940 & `varlist' <= 3949
		qui replace `generate' = 4 if `varlist' >= 7800 & `varlist' <= 7829
		qui replace `generate' = 4 if `varlist' >= 7830 & `varlist' <= 7833
		qui replace `generate' = 4 if `varlist' >= 7840 & `varlist' <= 7841
		qui replace `generate' = 4 if `varlist' >= 7900 & `varlist' <= 7900
		qui replace `generate' = 4 if `varlist' >= 7910 & `varlist' <= 7911
		qui replace `generate' = 4 if `varlist' >= 7920 & `varlist' <= 7929
		qui replace `generate' = 4 if `varlist' >= 7930 & `varlist' <= 7933
		qui replace `generate' = 4 if `varlist' >= 7940 & `varlist' <= 7949
		qui replace `generate' = 4 if `varlist' >= 7980 & `varlist' <= 7980
		qui replace `generate' = 4 if `varlist' >= 7990 & `varlist' <= 7999
		
		qui replace `generate' = 5 if `varlist' >= 2700 & `varlist' <= 2709
		qui replace `generate' = 5 if `varlist' >= 2710 & `varlist' <= 2719
		qui replace `generate' = 5 if `varlist' >= 2720 & `varlist' <= 2729
		qui replace `generate' = 5 if `varlist' >= 2730 & `varlist' <= 2739
		qui replace `generate' = 5 if `varlist' >= 2740 & `varlist' <= 2749
		qui replace `generate' = 5 if `varlist' >= 2750 & `varlist' <= 2759
		qui replace `generate' = 5 if `varlist' >= 2770 & `varlist' <= 2771
		qui replace `generate' = 5 if `varlist' >= 2780 & `varlist' <= 2789
		qui replace `generate' = 5 if `varlist' >= 2790 & `varlist' <= 2799
		qui replace `generate' = 5 if `varlist' >= 3993 & `varlist' <= 3993
		
		qui replace `generate' = 6 if `varlist' >= 2047 & `varlist' <= 2047
		qui replace `generate' = 6 if `varlist' >= 2391 & `varlist' <= 2392
		qui replace `generate' = 6 if `varlist' >= 2510 & `varlist' <= 2519
		qui replace `generate' = 6 if `varlist' >= 2590 & `varlist' <= 2599
		qui replace `generate' = 6 if `varlist' >= 2840 & `varlist' <= 2843
		qui replace `generate' = 6 if `varlist' >= 2844 & `varlist' <= 2844
		qui replace `generate' = 6 if `varlist' >= 3160 & `varlist' <= 3161
		qui replace `generate' = 6 if `varlist' >= 3170 & `varlist' <= 3171
		qui replace `generate' = 6 if `varlist' >= 3172 & `varlist' <= 3172
		qui replace `generate' = 6 if `varlist' >= 3190 & `varlist' <= 3199
		qui replace `generate' = 6 if `varlist' >= 3229 & `varlist' <= 3229
		qui replace `generate' = 6 if `varlist' >= 3260 & `varlist' <= 3260
		qui replace `generate' = 6 if `varlist' >= 3262 & `varlist' <= 3263
		qui replace `generate' = 6 if `varlist' >= 3269 & `varlist' <= 3269
		qui replace `generate' = 6 if `varlist' >= 3230 & `varlist' <= 3231
		qui replace `generate' = 6 if `varlist' >= 3630 & `varlist' <= 3639
		qui replace `generate' = 6 if `varlist' >= 3750 & `varlist' <= 3751
		qui replace `generate' = 6 if `varlist' >= 3800 & `varlist' <= 3800
		qui replace `generate' = 6 if `varlist' >= 3860 & `varlist' <= 3861
		qui replace `generate' = 6 if `varlist' >= 3870 & `varlist' <= 3873
		qui replace `generate' = 6 if `varlist' >= 3910 & `varlist' <= 3911
		qui replace `generate' = 6 if `varlist' >= 3914 & `varlist' <= 3914
		qui replace `generate' = 6 if `varlist' >= 3915 & `varlist' <= 3915
		qui replace `generate' = 6 if `varlist' >= 3960 & `varlist' <= 3962
		qui replace `generate' = 6 if `varlist' >= 3991 & `varlist' <= 3991
		qui replace `generate' = 6 if `varlist' >= 3995 & `varlist' <= 3995
		
		qui replace `generate' = 7 if `varlist' >= 2300 & `varlist' <= 2390
		qui replace `generate' = 7 if `varlist' >= 3020 & `varlist' <= 3021
		qui replace `generate' = 7 if `varlist' >= 3100 & `varlist' <= 3111
		qui replace `generate' = 7 if `varlist' >= 3130 & `varlist' <= 3131
		qui replace `generate' = 7 if `varlist' >= 3140 & `varlist' <= 3149
		qui replace `generate' = 7 if `varlist' >= 3150 & `varlist' <= 3151
		qui replace `generate' = 7 if `varlist' >= 3963 & `varlist' <= 3965
		
		qui replace `generate' = 8 if `varlist' >= 2830 & `varlist' <= 2830
		qui replace `generate' = 8 if `varlist' >= 2831 & `varlist' <= 2831
		qui replace `generate' = 8 if `varlist' >= 2833 & `varlist' <= 2833
		qui replace `generate' = 8 if `varlist' >= 2834 & `varlist' <= 2834
		qui replace `generate' = 8 if `varlist' >= 2835 & `varlist' <= 2835
		qui replace `generate' = 8 if `varlist' >= 2836 & `varlist' <= 2836
		qui replace `generate' = 8 if `varlist' >= 3693 & `varlist' <= 3693
		qui replace `generate' = 8 if `varlist' >= 3840 & `varlist' <= 3849
		qui replace `generate' = 8 if `varlist' >= 3850 & `varlist' <= 3851
		qui replace `generate' = 8 if `varlist' >= 8000 & `varlist' <= 8099
		
		qui replace `generate' = 9 if `varlist' >= 2800 & `varlist' <= 2809
		qui replace `generate' = 9 if `varlist' >= 2810 & `varlist' <= 2819
		qui replace `generate' = 9 if `varlist' >= 2820 & `varlist' <= 2829
		qui replace `generate' = 9 if `varlist' >= 2850 & `varlist' <= 2859
		qui replace `generate' = 9 if `varlist' >= 2860 & `varlist' <= 2869
		qui replace `generate' = 9 if `varlist' >= 2870 & `varlist' <= 2879
		qui replace `generate' = 9 if `varlist' >= 2890 & `varlist' <= 2899
		
		qui replace `generate' = 10 if `varlist' >= 2200 & `varlist' <= 2269
		qui replace `generate' = 10 if `varlist' >= 2270 & `varlist' <= 2279
		qui replace `generate' = 10 if `varlist' >= 2280 & `varlist' <= 2284
		qui replace `generate' = 10 if `varlist' >= 2290 & `varlist' <= 2295
		qui replace `generate' = 10 if `varlist' >= 2297 & `varlist' <= 2297
		qui replace `generate' = 10 if `varlist' >= 2298 & `varlist' <= 2298
		qui replace `generate' = 10 if `varlist' >= 2299 & `varlist' <= 2299
		qui replace `generate' = 10 if `varlist' >= 2393 & `varlist' <= 2395
		qui replace `generate' = 10 if `varlist' >= 2397 & `varlist' <= 2399
		
		qui replace `generate' = 11 if `varlist' >= 0800 & `varlist' <= 0899
		qui replace `generate' = 11 if `varlist' >= 1500 & `varlist' <= 1511
		qui replace `generate' = 11 if `varlist' >= 1520 & `varlist' <= 1529
		qui replace `generate' = 11 if `varlist' >= 1530 & `varlist' <= 1539
		qui replace `generate' = 11 if `varlist' >= 1540 & `varlist' <= 1549
		qui replace `generate' = 11 if `varlist' >= 1600 & `varlist' <= 1699
		qui replace `generate' = 11 if `varlist' >= 1700 & `varlist' <= 1799
		qui replace `generate' = 11 if `varlist' >= 2400 & `varlist' <= 2439
		qui replace `generate' = 11 if `varlist' >= 2450 & `varlist' <= 2459
		qui replace `generate' = 11 if `varlist' >= 2490 & `varlist' <= 2499
		qui replace `generate' = 11 if `varlist' >= 2660 & `varlist' <= 2661
		qui replace `generate' = 11 if `varlist' >= 2950 & `varlist' <= 2952
		qui replace `generate' = 11 if `varlist' >= 3200 & `varlist' <= 3200
		qui replace `generate' = 11 if `varlist' >= 3210 & `varlist' <= 3211
		qui replace `generate' = 11 if `varlist' >= 3240 & `varlist' <= 3241
		qui replace `generate' = 11 if `varlist' >= 3250 & `varlist' <= 3259
		qui replace `generate' = 11 if `varlist' >= 3261 & `varlist' <= 3261
		qui replace `generate' = 11 if `varlist' >= 3264 & `varlist' <= 3264
		qui replace `generate' = 11 if `varlist' >= 3270 & `varlist' <= 3275
		qui replace `generate' = 11 if `varlist' >= 3280 & `varlist' <= 3281
		qui replace `generate' = 11 if `varlist' >= 3290 & `varlist' <= 3293
		qui replace `generate' = 11 if `varlist' >= 3295 & `varlist' <= 3299
		qui replace `generate' = 11 if `varlist' >= 3420 & `varlist' <= 3429
		qui replace `generate' = 11 if `varlist' >= 3430 & `varlist' <= 3433
		qui replace `generate' = 11 if `varlist' >= 3440 & `varlist' <= 3441
		qui replace `generate' = 11 if `varlist' >= 3442 & `varlist' <= 3442
		qui replace `generate' = 11 if `varlist' >= 3446 & `varlist' <= 3446
		qui replace `generate' = 11 if `varlist' >= 3448 & `varlist' <= 3448
		qui replace `generate' = 11 if `varlist' >= 3449 & `varlist' <= 3449
		qui replace `generate' = 11 if `varlist' >= 3450 & `varlist' <= 3451
		qui replace `generate' = 11 if `varlist' >= 3452 & `varlist' <= 3452
		qui replace `generate' = 11 if `varlist' >= 3490 & `varlist' <= 3499
		qui replace `generate' = 11 if `varlist' >= 3996 & `varlist' <= 3996
		
		qui replace `generate' = 12 if `varlist' >= 3300 & `varlist' <= 3300
		qui replace `generate' = 12 if `varlist' >= 3310 & `varlist' <= 3317
		qui replace `generate' = 12 if `varlist' >= 3320 & `varlist' <= 3325
		qui replace `generate' = 12 if `varlist' >= 3330 & `varlist' <= 3339
		qui replace `generate' = 12 if `varlist' >= 3340 & `varlist' <= 3341
		qui replace `generate' = 12 if `varlist' >= 3350 & `varlist' <= 3357
		qui replace `generate' = 12 if `varlist' >= 3360 & `varlist' <= 3369
		qui replace `generate' = 12 if `varlist' >= 3370 & `varlist' <= 3379
		qui replace `generate' = 12 if `varlist' >= 3390 & `varlist' <= 3399
		
		qui replace `generate' = 13 if `varlist' >= 3400 & `varlist' <= 3400
		qui replace `generate' = 13 if `varlist' >= 3443 & `varlist' <= 3443
		qui replace `generate' = 13 if `varlist' >= 3444 & `varlist' <= 3444
		qui replace `generate' = 13 if `varlist' >= 3460 & `varlist' <= 3469
		qui replace `generate' = 13 if `varlist' >= 3470 & `varlist' <= 3479
		qui replace `generate' = 13 if `varlist' >= 3510 & `varlist' <= 3519
		qui replace `generate' = 13 if `varlist' >= 3520 & `varlist' <= 3529
		qui replace `generate' = 13 if `varlist' >= 3530 & `varlist' <= 3530
		qui replace `generate' = 13 if `varlist' >= 3531 & `varlist' <= 3531
		qui replace `generate' = 13 if `varlist' >= 3532 & `varlist' <= 3532
		qui replace `generate' = 13 if `varlist' >= 3533 & `varlist' <= 3533
		qui replace `generate' = 13 if `varlist' >= 3534 & `varlist' <= 3534
		qui replace `generate' = 13 if `varlist' >= 3535 & `varlist' <= 3535
		qui replace `generate' = 13 if `varlist' >= 3536 & `varlist' <= 3536
		qui replace `generate' = 13 if `varlist' >= 3538 & `varlist' <= 3538
		qui replace `generate' = 13 if `varlist' >= 3540 & `varlist' <= 3549
		qui replace `generate' = 13 if `varlist' >= 3550 & `varlist' <= 3559
		qui replace `generate' = 13 if `varlist' >= 3560 & `varlist' <= 3569
		qui replace `generate' = 13 if `varlist' >= 3580 & `varlist' <= 3580
		qui replace `generate' = 13 if `varlist' >= 3581 & `varlist' <= 3581
		qui replace `generate' = 13 if `varlist' >= 3582 & `varlist' <= 3582
		qui replace `generate' = 13 if `varlist' >= 3585 & `varlist' <= 3585
		qui replace `generate' = 13 if `varlist' >= 3586 & `varlist' <= 3586
		qui replace `generate' = 13 if `varlist' >= 3589 & `varlist' <= 3589
		qui replace `generate' = 13 if `varlist' >= 3590 & `varlist' <= 3599
		
		qui replace `generate' = 14 if `varlist' >= 3600 & `varlist' <= 3600
		qui replace `generate' = 14 if `varlist' >= 3610 & `varlist' <= 3613
		qui replace `generate' = 14 if `varlist' >= 3620 & `varlist' <= 3621
		qui replace `generate' = 14 if `varlist' >= 3623 & `varlist' <= 3629
		qui replace `generate' = 14 if `varlist' >= 3640 & `varlist' <= 3644
		qui replace `generate' = 14 if `varlist' >= 3645 & `varlist' <= 3645
		qui replace `generate' = 14 if `varlist' >= 3646 & `varlist' <= 3646
		qui replace `generate' = 14 if `varlist' >= 3648 & `varlist' <= 3649
		qui replace `generate' = 14 if `varlist' >= 3660 & `varlist' <= 3660
		qui replace `generate' = 14 if `varlist' >= 3690 & `varlist' <= 3690
		qui replace `generate' = 14 if `varlist' >= 3691 & `varlist' <= 3692
		qui replace `generate' = 14 if `varlist' >= 3699 & `varlist' <= 3699
		
		qui replace `generate' = 15 if `varlist' >= 2296 & `varlist' <= 2296
		qui replace `generate' = 15 if `varlist' >= 2396 & `varlist' <= 2396
		qui replace `generate' = 15 if `varlist' >= 3010 & `varlist' <= 3011
		qui replace `generate' = 15 if `varlist' >= 3537 & `varlist' <= 3537
		qui replace `generate' = 15 if `varlist' >= 3647 & `varlist' <= 3647
		qui replace `generate' = 15 if `varlist' >= 3694 & `varlist' <= 3694
		qui replace `generate' = 15 if `varlist' >= 3700 & `varlist' <= 3700
		qui replace `generate' = 15 if `varlist' >= 3710 & `varlist' <= 3710
		qui replace `generate' = 15 if `varlist' >= 3711 & `varlist' <= 3711
		qui replace `generate' = 15 if `varlist' >= 3713 & `varlist' <= 3713
		qui replace `generate' = 15 if `varlist' >= 3714 & `varlist' <= 3714
		qui replace `generate' = 15 if `varlist' >= 3715 & `varlist' <= 3715
		qui replace `generate' = 15 if `varlist' >= 3716 & `varlist' <= 3716
		qui replace `generate' = 15 if `varlist' >= 3792 & `varlist' <= 3792
		qui replace `generate' = 15 if `varlist' >= 3790 & `varlist' <= 3791
		qui replace `generate' = 15 if `varlist' >= 3799 & `varlist' <= 3799
		
		qui replace `generate' = 16 if `varlist' >= 3720 & `varlist' <= 3720
		qui replace `generate' = 16 if `varlist' >= 3721 & `varlist' <= 3721
		qui replace `generate' = 16 if `varlist' >= 3723 & `varlist' <= 3724
		qui replace `generate' = 16 if `varlist' >= 3725 & `varlist' <= 3725
		qui replace `generate' = 16 if `varlist' >= 3728 & `varlist' <= 3729
		qui replace `generate' = 16 if `varlist' >= 3730 & `varlist' <= 3731
		qui replace `generate' = 16 if `varlist' >= 3740 & `varlist' <= 3743
		
		qui replace `generate' = 17 if `varlist' >= 1000 & `varlist' <= 1009
		qui replace `generate' = 17 if `varlist' >= 1010 & `varlist' <= 1019
		qui replace `generate' = 17 if `varlist' >= 1020 & `varlist' <= 1029
		qui replace `generate' = 17 if `varlist' >= 1030 & `varlist' <= 1039
		qui replace `generate' = 17 if `varlist' >= 1040 & `varlist' <= 1049
		qui replace `generate' = 17 if `varlist' >= 1050 & `varlist' <= 1059
		qui replace `generate' = 17 if `varlist' >= 1060 & `varlist' <= 1069
		qui replace `generate' = 17 if `varlist' >= 1070 & `varlist' <= 1079
		qui replace `generate' = 17 if `varlist' >= 1080 & `varlist' <= 1089
		qui replace `generate' = 17 if `varlist' >= 1090 & `varlist' <= 1099
		qui replace `generate' = 17 if `varlist' >= 1100 & `varlist' <= 1119
		qui replace `generate' = 17 if `varlist' >= 1400 & `varlist' <= 1499
		
		qui replace `generate' = 18 if `varlist' >= 1200 & `varlist' <= 1299
		
		qui replace `generate' = 19 if `varlist' >= 1300 & `varlist' <= 1300
		qui replace `generate' = 19 if `varlist' >= 1310 & `varlist' <= 1319
		qui replace `generate' = 19 if `varlist' >= 1320 & `varlist' <= 1329
		qui replace `generate' = 19 if `varlist' >= 1330 & `varlist' <= 1339
		qui replace `generate' = 19 if `varlist' >= 1370 & `varlist' <= 1379
		qui replace `generate' = 19 if `varlist' >= 1380 & `varlist' <= 1380
		qui replace `generate' = 19 if `varlist' >= 1381 & `varlist' <= 1381
		qui replace `generate' = 19 if `varlist' >= 1382 & `varlist' <= 1382
		qui replace `generate' = 19 if `varlist' >= 1389 & `varlist' <= 1389
		qui replace `generate' = 19 if `varlist' >= 2900 & `varlist' <= 2912
		qui replace `generate' = 19 if `varlist' >= 2990 & `varlist' <= 2999
		
		qui replace `generate' = 20 if `varlist' >= 4900 & `varlist' <= 4900
		qui replace `generate' = 20 if `varlist' >= 4910 & `varlist' <= 4911
		qui replace `generate' = 20 if `varlist' >= 4920 & `varlist' <= 4922
		qui replace `generate' = 20 if `varlist' >= 4923 & `varlist' <= 4923
		qui replace `generate' = 20 if `varlist' >= 4924 & `varlist' <= 4925
		qui replace `generate' = 20 if `varlist' >= 4930 & `varlist' <= 4931
		qui replace `generate' = 20 if `varlist' >= 4932 & `varlist' <= 4932
		qui replace `generate' = 20 if `varlist' >= 4939 & `varlist' <= 4939
		qui replace `generate' = 20 if `varlist' >= 4940 & `varlist' <= 4942
		
		qui replace `generate' = 21 if `varlist' >= 4800 & `varlist' <= 4800
		qui replace `generate' = 21 if `varlist' >= 4810 & `varlist' <= 4813
		qui replace `generate' = 21 if `varlist' >= 4820 & `varlist' <= 4822
		qui replace `generate' = 21 if `varlist' >= 4830 & `varlist' <= 4839
		qui replace `generate' = 21 if `varlist' >= 4840 & `varlist' <= 4841
		qui replace `generate' = 21 if `varlist' >= 4880 & `varlist' <= 4889
		qui replace `generate' = 21 if `varlist' >= 4890 & `varlist' <= 4890
		qui replace `generate' = 21 if `varlist' >= 4891 & `varlist' <= 4891
		qui replace `generate' = 21 if `varlist' >= 4892 & `varlist' <= 4892
		qui replace `generate' = 21 if `varlist' >= 4899 & `varlist' <= 4899
		
		qui replace `generate' = 22 if `varlist' >= 7020 & `varlist' <= 7021
		qui replace `generate' = 22 if `varlist' >= 7030 & `varlist' <= 7033
		qui replace `generate' = 22 if `varlist' >= 7200 & `varlist' <= 7200
		qui replace `generate' = 22 if `varlist' >= 7210 & `varlist' <= 7212
		qui replace `generate' = 22 if `varlist' >= 7214 & `varlist' <= 7214
		qui replace `generate' = 22 if `varlist' >= 7215 & `varlist' <= 7216
		qui replace `generate' = 22 if `varlist' >= 7217 & `varlist' <= 7217
		qui replace `generate' = 22 if `varlist' >= 7218 & `varlist' <= 7218
		qui replace `generate' = 22 if `varlist' >= 7219 & `varlist' <= 7219
		qui replace `generate' = 22 if `varlist' >= 7220 & `varlist' <= 7221
		qui replace `generate' = 22 if `varlist' >= 7230 & `varlist' <= 7231
		qui replace `generate' = 22 if `varlist' >= 7240 & `varlist' <= 7241
		qui replace `generate' = 22 if `varlist' >= 7250 & `varlist' <= 7251
		qui replace `generate' = 22 if `varlist' >= 7260 & `varlist' <= 7269
		qui replace `generate' = 22 if `varlist' >= 7270 & `varlist' <= 7290
		qui replace `generate' = 22 if `varlist' >= 7291 & `varlist' <= 7291
		qui replace `generate' = 22 if `varlist' >= 7292 & `varlist' <= 7299
		qui replace `generate' = 22 if `varlist' >= 7300 & `varlist' <= 7300
		qui replace `generate' = 22 if `varlist' >= 7310 & `varlist' <= 7319
		qui replace `generate' = 22 if `varlist' >= 7320 & `varlist' <= 7329
		qui replace `generate' = 22 if `varlist' >= 7330 & `varlist' <= 7339
		qui replace `generate' = 22 if `varlist' >= 7340 & `varlist' <= 7342
		qui replace `generate' = 22 if `varlist' >= 7349 & `varlist' <= 7349
		qui replace `generate' = 22 if `varlist' >= 7350 & `varlist' <= 7351
		qui replace `generate' = 22 if `varlist' >= 7352 & `varlist' <= 7352
		qui replace `generate' = 22 if `varlist' >= 7353 & `varlist' <= 7353
		qui replace `generate' = 22 if `varlist' >= 7359 & `varlist' <= 7359
		qui replace `generate' = 22 if `varlist' >= 7360 & `varlist' <= 7369
		qui replace `generate' = 22 if `varlist' >= 7370 & `varlist' <= 7372
		qui replace `generate' = 22 if `varlist' >= 7374 & `varlist' <= 7374
		qui replace `generate' = 22 if `varlist' >= 7375 & `varlist' <= 7375
		qui replace `generate' = 22 if `varlist' >= 7376 & `varlist' <= 7376
		qui replace `generate' = 22 if `varlist' >= 7377 & `varlist' <= 7377
		qui replace `generate' = 22 if `varlist' >= 7378 & `varlist' <= 7378
		qui replace `generate' = 22 if `varlist' >= 7379 & `varlist' <= 7379
		qui replace `generate' = 22 if `varlist' >= 7380 & `varlist' <= 7380
		qui replace `generate' = 22 if `varlist' >= 7381 & `varlist' <= 7382
		qui replace `generate' = 22 if `varlist' >= 7383 & `varlist' <= 7383
		qui replace `generate' = 22 if `varlist' >= 7384 & `varlist' <= 7384
		qui replace `generate' = 22 if `varlist' >= 7385 & `varlist' <= 7385
		qui replace `generate' = 22 if `varlist' >= 7389 & `varlist' <= 7390
		qui replace `generate' = 22 if `varlist' >= 7391 & `varlist' <= 7391
		qui replace `generate' = 22 if `varlist' >= 7392 & `varlist' <= 7392
		qui replace `generate' = 22 if `varlist' >= 7393 & `varlist' <= 7393
		qui replace `generate' = 22 if `varlist' >= 7394 & `varlist' <= 7394
		qui replace `generate' = 22 if `varlist' >= 7395 & `varlist' <= 7395
		qui replace `generate' = 22 if `varlist' >= 7396 & `varlist' <= 7396
		qui replace `generate' = 22 if `varlist' >= 7397 & `varlist' <= 7397
		qui replace `generate' = 22 if `varlist' >= 7399 & `varlist' <= 7399
		qui replace `generate' = 22 if `varlist' >= 7500 & `varlist' <= 7500
		qui replace `generate' = 22 if `varlist' >= 7510 & `varlist' <= 7519
		qui replace `generate' = 22 if `varlist' >= 7520 & `varlist' <= 7529
		qui replace `generate' = 22 if `varlist' >= 7530 & `varlist' <= 7539
		qui replace `generate' = 22 if `varlist' >= 7540 & `varlist' <= 7549
		qui replace `generate' = 22 if `varlist' >= 7600 & `varlist' <= 7600
		qui replace `generate' = 22 if `varlist' >= 7620 & `varlist' <= 7620
		qui replace `generate' = 22 if `varlist' >= 7622 & `varlist' <= 7622
		qui replace `generate' = 22 if `varlist' >= 7623 & `varlist' <= 7623
		qui replace `generate' = 22 if `varlist' >= 7629 & `varlist' <= 7629
		qui replace `generate' = 22 if `varlist' >= 7630 & `varlist' <= 7631
		qui replace `generate' = 22 if `varlist' >= 7640 & `varlist' <= 7641
		qui replace `generate' = 22 if `varlist' >= 7690 & `varlist' <= 7699
		qui replace `generate' = 22 if `varlist' >= 8100 & `varlist' <= 8199
		qui replace `generate' = 22 if `varlist' >= 8200 & `varlist' <= 8299
		qui replace `generate' = 22 if `varlist' >= 8300 & `varlist' <= 8399
		qui replace `generate' = 22 if `varlist' >= 8400 & `varlist' <= 8499
		qui replace `generate' = 22 if `varlist' >= 8600 & `varlist' <= 8699
		qui replace `generate' = 22 if `varlist' >= 8700 & `varlist' <= 8700
		qui replace `generate' = 22 if `varlist' >= 8710 & `varlist' <= 8713
		qui replace `generate' = 22 if `varlist' >= 8720 & `varlist' <= 8721
		qui replace `generate' = 22 if `varlist' >= 8730 & `varlist' <= 8734
		qui replace `generate' = 22 if `varlist' >= 8740 & `varlist' <= 8748
		qui replace `generate' = 22 if `varlist' >= 8800 & `varlist' <= 8899
		qui replace `generate' = 22 if `varlist' >= 8900 & `varlist' <= 8910
		qui replace `generate' = 22 if `varlist' >= 8911 & `varlist' <= 8911
		qui replace `generate' = 22 if `varlist' >= 8920 & `varlist' <= 8999
		
		qui replace `generate' = 23 if `varlist' >= 3570 & `varlist' <= 3579
		qui replace `generate' = 23 if `varlist' >= 3622 & `varlist' <= 3622
		qui replace `generate' = 23 if `varlist' >= 3661 & `varlist' <= 3661
		qui replace `generate' = 23 if `varlist' >= 3662 & `varlist' <= 3662
		qui replace `generate' = 23 if `varlist' >= 3663 & `varlist' <= 3663
		qui replace `generate' = 23 if `varlist' >= 3664 & `varlist' <= 3664
		qui replace `generate' = 23 if `varlist' >= 3665 & `varlist' <= 3665
		qui replace `generate' = 23 if `varlist' >= 3666 & `varlist' <= 3666
		qui replace `generate' = 23 if `varlist' >= 3669 & `varlist' <= 3669
		qui replace `generate' = 23 if `varlist' >= 3670 & `varlist' <= 3679
		qui replace `generate' = 23 if `varlist' >= 3680 & `varlist' <= 3680
		qui replace `generate' = 23 if `varlist' >= 3681 & `varlist' <= 3681
		qui replace `generate' = 23 if `varlist' >= 3682 & `varlist' <= 3682
		qui replace `generate' = 23 if `varlist' >= 3683 & `varlist' <= 3683
		qui replace `generate' = 23 if `varlist' >= 3684 & `varlist' <= 3684
		qui replace `generate' = 23 if `varlist' >= 3685 & `varlist' <= 3685
		qui replace `generate' = 23 if `varlist' >= 3686 & `varlist' <= 3686
		qui replace `generate' = 23 if `varlist' >= 3687 & `varlist' <= 3687
		qui replace `generate' = 23 if `varlist' >= 3688 & `varlist' <= 3688
		qui replace `generate' = 23 if `varlist' >= 3689 & `varlist' <= 3689
		qui replace `generate' = 23 if `varlist' >= 3695 & `varlist' <= 3695
		qui replace `generate' = 23 if `varlist' >= 3810 & `varlist' <= 3810
		qui replace `generate' = 23 if `varlist' >= 3811 & `varlist' <= 3811
		qui replace `generate' = 23 if `varlist' >= 3812 & `varlist' <= 3812
		qui replace `generate' = 23 if `varlist' >= 3820 & `varlist' <= 3820
		qui replace `generate' = 23 if `varlist' >= 3821 & `varlist' <= 3821
		qui replace `generate' = 23 if `varlist' >= 3822 & `varlist' <= 3822
		qui replace `generate' = 23 if `varlist' >= 3823 & `varlist' <= 3823
		qui replace `generate' = 23 if `varlist' >= 3824 & `varlist' <= 3824
		qui replace `generate' = 23 if `varlist' >= 3825 & `varlist' <= 3825
		qui replace `generate' = 23 if `varlist' >= 3826 & `varlist' <= 3826
		qui replace `generate' = 23 if `varlist' >= 3827 & `varlist' <= 3827
		qui replace `generate' = 23 if `varlist' >= 3829 & `varlist' <= 3829
		qui replace `generate' = 23 if `varlist' >= 3830 & `varlist' <= 3839
		qui replace `generate' = 23 if `varlist' >= 7373 & `varlist' <= 7373
		
		qui replace `generate' = 24 if `varlist' >= 2440 & `varlist' <= 2449
		qui replace `generate' = 24 if `varlist' >= 2520 & `varlist' <= 2549
		qui replace `generate' = 24 if `varlist' >= 2600 & `varlist' <= 2639
		qui replace `generate' = 24 if `varlist' >= 2640 & `varlist' <= 2659
		qui replace `generate' = 24 if `varlist' >= 2670 & `varlist' <= 2699
		qui replace `generate' = 24 if `varlist' >= 2760 & `varlist' <= 2761
		qui replace `generate' = 24 if `varlist' >= 3220 & `varlist' <= 3221
		qui replace `generate' = 24 if `varlist' >= 3410 & `varlist' <= 3412
		qui replace `generate' = 24 if `varlist' >= 3950 & `varlist' <= 3955
		
		qui replace `generate' = 25 if `varlist' >= 4000 & `varlist' <= 4013
		qui replace `generate' = 25 if `varlist' >= 4040 & `varlist' <= 4049
		qui replace `generate' = 25 if `varlist' >= 4100 & `varlist' <= 4100
		qui replace `generate' = 25 if `varlist' >= 4110 & `varlist' <= 4119
		qui replace `generate' = 25 if `varlist' >= 4120 & `varlist' <= 4121
		qui replace `generate' = 25 if `varlist' >= 4130 & `varlist' <= 4131
		qui replace `generate' = 25 if `varlist' >= 4140 & `varlist' <= 4142
		qui replace `generate' = 25 if `varlist' >= 4150 & `varlist' <= 4151
		qui replace `generate' = 25 if `varlist' >= 4170 & `varlist' <= 4173
		qui replace `generate' = 25 if `varlist' >= 4190 & `varlist' <= 4199
		qui replace `generate' = 25 if `varlist' >= 4200 & `varlist' <= 4200
		qui replace `generate' = 25 if `varlist' >= 4210 & `varlist' <= 4219
		qui replace `generate' = 25 if `varlist' >= 4220 & `varlist' <= 4229
		qui replace `generate' = 25 if `varlist' >= 4230 & `varlist' <= 4231
		qui replace `generate' = 25 if `varlist' >= 4240 & `varlist' <= 4249
		qui replace `generate' = 25 if `varlist' >= 4400 & `varlist' <= 4499
		qui replace `generate' = 25 if `varlist' >= 4500 & `varlist' <= 4599
		qui replace `generate' = 25 if `varlist' >= 4600 & `varlist' <= 4699
		qui replace `generate' = 25 if `varlist' >= 4700 & `varlist' <= 4700
		qui replace `generate' = 25 if `varlist' >= 4710 & `varlist' <= 4712
		qui replace `generate' = 25 if `varlist' >= 4720 & `varlist' <= 4729
		qui replace `generate' = 25 if `varlist' >= 4730 & `varlist' <= 4739
		qui replace `generate' = 25 if `varlist' >= 4740 & `varlist' <= 4749
		qui replace `generate' = 25 if `varlist' >= 4780 & `varlist' <= 4780
		qui replace `generate' = 25 if `varlist' >= 4782 & `varlist' <= 4782
		qui replace `generate' = 25 if `varlist' >= 4783 & `varlist' <= 4783
		qui replace `generate' = 25 if `varlist' >= 4784 & `varlist' <= 4784
		qui replace `generate' = 25 if `varlist' >= 4785 & `varlist' <= 4785
		qui replace `generate' = 25 if `varlist' >= 4789 & `varlist' <= 4789
		
		qui replace `generate' = 26 if `varlist' >= 5000 & `varlist' <= 5000
		qui replace `generate' = 26 if `varlist' >= 5010 & `varlist' <= 5015
		qui replace `generate' = 26 if `varlist' >= 5020 & `varlist' <= 5023
		qui replace `generate' = 26 if `varlist' >= 5030 & `varlist' <= 5039
		qui replace `generate' = 26 if `varlist' >= 5040 & `varlist' <= 5042
		qui replace `generate' = 26 if `varlist' >= 5043 & `varlist' <= 5043
		qui replace `generate' = 26 if `varlist' >= 5044 & `varlist' <= 5044
		qui replace `generate' = 26 if `varlist' >= 5045 & `varlist' <= 5045
		qui replace `generate' = 26 if `varlist' >= 5046 & `varlist' <= 5046
		qui replace `generate' = 26 if `varlist' >= 5047 & `varlist' <= 5047
		qui replace `generate' = 26 if `varlist' >= 5048 & `varlist' <= 5048
		qui replace `generate' = 26 if `varlist' >= 5049 & `varlist' <= 5049
		qui replace `generate' = 26 if `varlist' >= 5050 & `varlist' <= 5059
		qui replace `generate' = 26 if `varlist' >= 5060 & `varlist' <= 5060
		qui replace `generate' = 26 if `varlist' >= 5063 & `varlist' <= 5063
		qui replace `generate' = 26 if `varlist' >= 5064 & `varlist' <= 5064
		qui replace `generate' = 26 if `varlist' >= 5065 & `varlist' <= 5065
		qui replace `generate' = 26 if `varlist' >= 5070 & `varlist' <= 5078
		qui replace `generate' = 26 if `varlist' >= 5080 & `varlist' <= 5080
		qui replace `generate' = 26 if `varlist' >= 5081 & `varlist' <= 5081
		qui replace `generate' = 26 if `varlist' >= 5082 & `varlist' <= 5082
		qui replace `generate' = 26 if `varlist' >= 5083 & `varlist' <= 5083
		qui replace `generate' = 26 if `varlist' >= 5084 & `varlist' <= 5084
		qui replace `generate' = 26 if `varlist' >= 5085 & `varlist' <= 5085
		qui replace `generate' = 26 if `varlist' >= 5086 & `varlist' <= 5087
		qui replace `generate' = 26 if `varlist' >= 5088 & `varlist' <= 5088
		qui replace `generate' = 26 if `varlist' >= 5090 & `varlist' <= 5090
		qui replace `generate' = 26 if `varlist' >= 5091 & `varlist' <= 5092
		qui replace `generate' = 26 if `varlist' >= 5093 & `varlist' <= 5093
		qui replace `generate' = 26 if `varlist' >= 5094 & `varlist' <= 5094
		qui replace `generate' = 26 if `varlist' >= 5099 & `varlist' <= 5099
		qui replace `generate' = 26 if `varlist' >= 5100 & `varlist' <= 5100
		qui replace `generate' = 26 if `varlist' >= 5110 & `varlist' <= 5113
		qui replace `generate' = 26 if `varlist' >= 5120 & `varlist' <= 5122
		qui replace `generate' = 26 if `varlist' >= 5130 & `varlist' <= 5139
		qui replace `generate' = 26 if `varlist' >= 5140 & `varlist' <= 5149
		qui replace `generate' = 26 if `varlist' >= 5150 & `varlist' <= 5159
		qui replace `generate' = 26 if `varlist' >= 5160 & `varlist' <= 5169
		qui replace `generate' = 26 if `varlist' >= 5170 & `varlist' <= 5172
		qui replace `generate' = 26 if `varlist' >= 5180 & `varlist' <= 5182
		qui replace `generate' = 26 if `varlist' >= 5190 & `varlist' <= 5199
		
		qui replace `generate' = 27 if `varlist' >= 5200 & `varlist' <= 5200
		qui replace `generate' = 27 if `varlist' >= 5210 & `varlist' <= 5219
		qui replace `generate' = 27 if `varlist' >= 5220 & `varlist' <= 5229
		qui replace `generate' = 27 if `varlist' >= 5230 & `varlist' <= 5231
		qui replace `generate' = 27 if `varlist' >= 5250 & `varlist' <= 5251
		qui replace `generate' = 27 if `varlist' >= 5260 & `varlist' <= 5261
		qui replace `generate' = 27 if `varlist' >= 5270 & `varlist' <= 5271
		qui replace `generate' = 27 if `varlist' >= 5300 & `varlist' <= 5300
		qui replace `generate' = 27 if `varlist' >= 5310 & `varlist' <= 5311
		qui replace `generate' = 27 if `varlist' >= 5320 & `varlist' <= 5320
		qui replace `generate' = 27 if `varlist' >= 5330 & `varlist' <= 5331
		qui replace `generate' = 27 if `varlist' >= 5334 & `varlist' <= 5334
		qui replace `generate' = 27 if `varlist' >= 5340 & `varlist' <= 5349
		qui replace `generate' = 27 if `varlist' >= 5390 & `varlist' <= 5399
		qui replace `generate' = 27 if `varlist' >= 5400 & `varlist' <= 5400
		qui replace `generate' = 27 if `varlist' >= 5410 & `varlist' <= 5411
		qui replace `generate' = 27 if `varlist' >= 5412 & `varlist' <= 5412
		qui replace `generate' = 27 if `varlist' >= 5420 & `varlist' <= 5429
		qui replace `generate' = 27 if `varlist' >= 5430 & `varlist' <= 5439
		qui replace `generate' = 27 if `varlist' >= 5440 & `varlist' <= 5449
		qui replace `generate' = 27 if `varlist' >= 5450 & `varlist' <= 5459
		qui replace `generate' = 27 if `varlist' >= 5460 & `varlist' <= 5469
		qui replace `generate' = 27 if `varlist' >= 5490 & `varlist' <= 5499
		qui replace `generate' = 27 if `varlist' >= 5500 & `varlist' <= 5500
		qui replace `generate' = 27 if `varlist' >= 5510 & `varlist' <= 5529
		qui replace `generate' = 27 if `varlist' >= 5530 & `varlist' <= 5539
		qui replace `generate' = 27 if `varlist' >= 5540 & `varlist' <= 5549
		qui replace `generate' = 27 if `varlist' >= 5550 & `varlist' <= 5559
		qui replace `generate' = 27 if `varlist' >= 5560 & `varlist' <= 5569
		qui replace `generate' = 27 if `varlist' >= 5570 & `varlist' <= 5579
		qui replace `generate' = 27 if `varlist' >= 5590 & `varlist' <= 5599
		qui replace `generate' = 27 if `varlist' >= 5600 & `varlist' <= 5699
		qui replace `generate' = 27 if `varlist' >= 5700 & `varlist' <= 5700
		qui replace `generate' = 27 if `varlist' >= 5710 & `varlist' <= 5719
		qui replace `generate' = 27 if `varlist' >= 5720 & `varlist' <= 5722
		qui replace `generate' = 27 if `varlist' >= 5730 & `varlist' <= 5733
		qui replace `generate' = 27 if `varlist' >= 5734 & `varlist' <= 5734
		qui replace `generate' = 27 if `varlist' >= 5735 & `varlist' <= 5735
		qui replace `generate' = 27 if `varlist' >= 5736 & `varlist' <= 5736
		qui replace `generate' = 27 if `varlist' >= 5750 & `varlist' <= 5799
		qui replace `generate' = 27 if `varlist' >= 5900 & `varlist' <= 5900
		qui replace `generate' = 27 if `varlist' >= 5910 & `varlist' <= 5912
		qui replace `generate' = 27 if `varlist' >= 5920 & `varlist' <= 5929
		qui replace `generate' = 27 if `varlist' >= 5930 & `varlist' <= 5932
		qui replace `generate' = 27 if `varlist' >= 5940 & `varlist' <= 5940
		qui replace `generate' = 27 if `varlist' >= 5941 & `varlist' <= 5941
		qui replace `generate' = 27 if `varlist' >= 5942 & `varlist' <= 5942
		qui replace `generate' = 27 if `varlist' >= 5943 & `varlist' <= 5943
		qui replace `generate' = 27 if `varlist' >= 5944 & `varlist' <= 5944
		qui replace `generate' = 27 if `varlist' >= 5945 & `varlist' <= 5945
		qui replace `generate' = 27 if `varlist' >= 5946 & `varlist' <= 5946
		qui replace `generate' = 27 if `varlist' >= 5947 & `varlist' <= 5947
		qui replace `generate' = 27 if `varlist' >= 5948 & `varlist' <= 5948
		qui replace `generate' = 27 if `varlist' >= 5949 & `varlist' <= 5949
		qui replace `generate' = 27 if `varlist' >= 5950 & `varlist' <= 5959
		qui replace `generate' = 27 if `varlist' >= 5960 & `varlist' <= 5969
		qui replace `generate' = 27 if `varlist' >= 5970 & `varlist' <= 5979
		qui replace `generate' = 27 if `varlist' >= 5980 & `varlist' <= 5989
		qui replace `generate' = 27 if `varlist' >= 5990 & `varlist' <= 5990
		qui replace `generate' = 27 if `varlist' >= 5992 & `varlist' <= 5992
		qui replace `generate' = 27 if `varlist' >= 5993 & `varlist' <= 5993
		qui replace `generate' = 27 if `varlist' >= 5994 & `varlist' <= 5994
		qui replace `generate' = 27 if `varlist' >= 5995 & `varlist' <= 5995
		qui replace `generate' = 27 if `varlist' >= 5999 & `varlist' <= 5999
		
		qui replace `generate' = 28 if `varlist' >= 5800 & `varlist' <= 5819
		qui replace `generate' = 28 if `varlist' >= 5820 & `varlist' <= 5829
		qui replace `generate' = 28 if `varlist' >= 5890 & `varlist' <= 5899
		qui replace `generate' = 28 if `varlist' >= 7000 & `varlist' <= 7000
		qui replace `generate' = 28 if `varlist' >= 7010 & `varlist' <= 7019
		qui replace `generate' = 28 if `varlist' >= 7040 & `varlist' <= 7049
		qui replace `generate' = 28 if `varlist' >= 7213 & `varlist' <= 7213
		
		qui replace `generate' = 29 if `varlist' >= 6000 & `varlist' <= 6000
		qui replace `generate' = 29 if `varlist' >= 6010 & `varlist' <= 6019
		qui replace `generate' = 29 if `varlist' >= 6020 & `varlist' <= 6020
		qui replace `generate' = 29 if `varlist' >= 6021 & `varlist' <= 6021
		qui replace `generate' = 29 if `varlist' >= 6022 & `varlist' <= 6022
		qui replace `generate' = 29 if `varlist' >= 6023 & `varlist' <= 6024
		qui replace `generate' = 29 if `varlist' >= 6025 & `varlist' <= 6025
		qui replace `generate' = 29 if `varlist' >= 6026 & `varlist' <= 6026
		qui replace `generate' = 29 if `varlist' >= 6027 & `varlist' <= 6027
		qui replace `generate' = 29 if `varlist' >= 6028 & `varlist' <= 6029
		qui replace `generate' = 29 if `varlist' >= 6030 & `varlist' <= 6036
		qui replace `generate' = 29 if `varlist' >= 6040 & `varlist' <= 6059
		qui replace `generate' = 29 if `varlist' >= 6060 & `varlist' <= 6062
		qui replace `generate' = 29 if `varlist' >= 6080 & `varlist' <= 6082
		qui replace `generate' = 29 if `varlist' >= 6090 & `varlist' <= 6099
		qui replace `generate' = 29 if `varlist' >= 6100 & `varlist' <= 6100
		qui replace `generate' = 29 if `varlist' >= 6110 & `varlist' <= 6111
		qui replace `generate' = 29 if `varlist' >= 6112 & `varlist' <= 6113
		qui replace `generate' = 29 if `varlist' >= 6120 & `varlist' <= 6129
		qui replace `generate' = 29 if `varlist' >= 6130 & `varlist' <= 6139
		qui replace `generate' = 29 if `varlist' >= 6140 & `varlist' <= 6149
		qui replace `generate' = 29 if `varlist' >= 6150 & `varlist' <= 6159
		qui replace `generate' = 29 if `varlist' >= 6160 & `varlist' <= 6169
		qui replace `generate' = 29 if `varlist' >= 6170 & `varlist' <= 6179
		qui replace `generate' = 29 if `varlist' >= 6190 & `varlist' <= 6199
		qui replace `generate' = 29 if `varlist' >= 6200 & `varlist' <= 6299
		qui replace `generate' = 29 if `varlist' >= 6300 & `varlist' <= 6300
		qui replace `generate' = 29 if `varlist' >= 6310 & `varlist' <= 6319
		qui replace `generate' = 29 if `varlist' >= 6320 & `varlist' <= 6329
		qui replace `generate' = 29 if `varlist' >= 6330 & `varlist' <= 6331
		qui replace `generate' = 29 if `varlist' >= 6350 & `varlist' <= 6351
		qui replace `generate' = 29 if `varlist' >= 6360 & `varlist' <= 6361
		qui replace `generate' = 29 if `varlist' >= 6370 & `varlist' <= 6379
		qui replace `generate' = 29 if `varlist' >= 6390 & `varlist' <= 6399
		qui replace `generate' = 29 if `varlist' >= 6400 & `varlist' <= 6411
		qui replace `generate' = 29 if `varlist' >= 6500 & `varlist' <= 6500
		qui replace `generate' = 29 if `varlist' >= 6510 & `varlist' <= 6510
		qui replace `generate' = 29 if `varlist' >= 6512 & `varlist' <= 6512
		qui replace `generate' = 29 if `varlist' >= 6513 & `varlist' <= 6513
		qui replace `generate' = 29 if `varlist' >= 6514 & `varlist' <= 6514
		qui replace `generate' = 29 if `varlist' >= 6515 & `varlist' <= 6515
		qui replace `generate' = 29 if `varlist' >= 6517 & `varlist' <= 6519
		qui replace `generate' = 29 if `varlist' >= 6520 & `varlist' <= 6529
		qui replace `generate' = 29 if `varlist' >= 6530 & `varlist' <= 6531
		qui replace `generate' = 29 if `varlist' >= 6532 & `varlist' <= 6532
		qui replace `generate' = 29 if `varlist' >= 6540 & `varlist' <= 6541
		qui replace `generate' = 29 if `varlist' >= 6550 & `varlist' <= 6553
		qui replace `generate' = 29 if `varlist' >= 6590 & `varlist' <= 6599
		qui replace `generate' = 29 if `varlist' >= 6610 & `varlist' <= 6611
		qui replace `generate' = 29 if `varlist' >= 6700 & `varlist' <= 6700
		qui replace `generate' = 29 if `varlist' >= 6710 & `varlist' <= 6719
		qui replace `generate' = 29 if `varlist' >= 6720 & `varlist' <= 6722
		qui replace `generate' = 29 if `varlist' >= 6723 & `varlist' <= 6723
		qui replace `generate' = 29 if `varlist' >= 6724 & `varlist' <= 6724
		qui replace `generate' = 29 if `varlist' >= 6725 & `varlist' <= 6725
		qui replace `generate' = 29 if `varlist' >= 6726 & `varlist' <= 6726
		qui replace `generate' = 29 if `varlist' >= 6730 & `varlist' <= 6733
		qui replace `generate' = 29 if `varlist' >= 6740 & `varlist' <= 6779
		qui replace `generate' = 29 if `varlist' >= 6790 & `varlist' <= 6791
		qui replace `generate' = 29 if `varlist' >= 6792 & `varlist' <= 6792
		qui replace `generate' = 29 if `varlist' >= 6793 & `varlist' <= 6793
		qui replace `generate' = 29 if `varlist' >= 6794 & `varlist' <= 6794
		qui replace `generate' = 29 if `varlist' >= 6795 & `varlist' <= 6795
		qui replace `generate' = 29 if `varlist' >= 6798 & `varlist' <= 6798
		qui replace `generate' = 29 if `varlist' >= 6799 & `varlist' <= 6799
		
		qui replace `generate' = 30 if `varlist' >= 4950 & `varlist' <= 4959
		qui replace `generate' = 30 if `varlist' >= 4960 & `varlist' <= 4961
		qui replace `generate' = 30 if `varlist' >= 4970 & `varlist' <= 4971
		qui replace `generate' = 30 if `varlist' >= 4990 & `varlist' <= 4991
	}



	// Fama French 38 industry
	else if `industry' == 38 {
		qui replace `generate' = 1 if `varlist' >= 0100 & `varlist' <= 0999
		
		qui replace `generate' = 2 if `varlist' >= 1000 & `varlist' <= 1299
		
		qui replace `generate' = 3 if `varlist' >= 1300 & `varlist' <= 1399
		
		qui replace `generate' = 4 if `varlist' >= 1400 & `varlist' <= 1499
		
		qui replace `generate' = 5 if `varlist' >= 1500 & `varlist' <= 1799
		
		qui replace `generate' = 6 if `varlist' >= 2000 & `varlist' <= 2099
		
		qui replace `generate' = 7 if `varlist' >= 2100 & `varlist' <= 2199
		
		qui replace `generate' = 8 if `varlist' >= 2200 & `varlist' <= 2299
		
		qui replace `generate' = 9 if `varlist' >= 2300 & `varlist' <= 2399
		
		qui replace `generate' = 10 if `varlist' >= 2400 & `varlist' <= 2499
		
		qui replace `generate' = 11 if `varlist' >= 2500 & `varlist' <= 2599
		
		qui replace `generate' = 12 if `varlist' >= 2600 & `varlist' <= 2661
		
		qui replace `generate' = 13 if `varlist' >= 2700 & `varlist' <= 2799
		
		qui replace `generate' = 14 if `varlist' >= 2800 & `varlist' <= 2899
		
		qui replace `generate' = 15 if `varlist' >= 2900 & `varlist' <= 2999
		
		qui replace `generate' = 16 if `varlist' >= 3000 & `varlist' <= 3099
		
		qui replace `generate' = 17 if `varlist' >= 3100 & `varlist' <= 3199
		
		qui replace `generate' = 18 if `varlist' >= 3200 & `varlist' <= 3299
		
		qui replace `generate' = 19 if `varlist' >= 3300 & `varlist' <= 3399
		
		qui replace `generate' = 20 if `varlist' >= 3400 & `varlist' <= 3499
		
		qui replace `generate' = 21 if `varlist' >= 3500 & `varlist' <= 3599
		
		qui replace `generate' = 22 if `varlist' >= 3600 & `varlist' <= 3699
		
		qui replace `generate' = 23 if `varlist' >= 3700 & `varlist' <= 3799
		
		qui replace `generate' = 24 if `varlist' >= 3800 & `varlist' <= 3879
		
		qui replace `generate' = 25 if `varlist' >= 3900 & `varlist' <= 3999
		
		qui replace `generate' = 26 if `varlist' >= 4000 & `varlist' <= 4799
		
		qui replace `generate' = 27 if `varlist' >= 4800 & `varlist' <= 4829
		
		qui replace `generate' = 28 if `varlist' >= 4830 & `varlist' <= 4899
		
		qui replace `generate' = 29 if `varlist' >= 4900 & `varlist' <= 4949
		
		qui replace `generate' = 30 if `varlist' >= 4950 & `varlist' <= 4959
		
		qui replace `generate' = 31 if `varlist' >= 4960 & `varlist' <= 4969
		
		qui replace `generate' = 32 if `varlist' >= 4970 & `varlist' <= 4979
		
		qui replace `generate' = 33 if `varlist' >= 5000 & `varlist' <= 5199
		
		qui replace `generate' = 34 if `varlist' >= 5200 & `varlist' <= 5999
		
		qui replace `generate' = 35 if `varlist' >= 6000 & `varlist' <= 6999
		
		qui replace `generate' = 36 if `varlist' >= 7000 & `varlist' <= 8999
		
		qui replace `generate' = 37 if `varlist' >= 9000 & `varlist' <= 9999
	}



	// Fama French 48 industry
	else if `industry' == 48 {
		famafrench48 `generate' `varlist'
	}



	// Fama French 49 industry
	else if `industry' == 49 {
		famafrench49 `generate' `varlist'
	}



	// Throw an error if industry is incorrect
	else {
		drop `generate'
		display as error "Industry option can only be 5, 10, 12, 17, 30, 38, 48, or 49."
		exit 175
	}
end

// Apparently you can't have too many lines in a given program.
// So here are another 2 programs that the previous program can call.

program famafrench48
	qui replace `1' = 1 if `2' >= 0100 & `2' <= 0199
	qui replace `1' = 1 if `2' >= 0200 & `2' <= 0299
	qui replace `1' = 1 if `2' >= 0700 & `2' <= 0799
	qui replace `1' = 1 if `2' >= 0910 & `2' <= 0919
	qui replace `1' = 1 if `2' >= 2048 & `2' <= 2048
	
	qui replace `1' = 2 if `2' >= 2000 & `2' <= 2009
	qui replace `1' = 2 if `2' >= 2010 & `2' <= 2019
	qui replace `1' = 2 if `2' >= 2020 & `2' <= 2029
	qui replace `1' = 2 if `2' >= 2030 & `2' <= 2039
	qui replace `1' = 2 if `2' >= 2040 & `2' <= 2046
	qui replace `1' = 2 if `2' >= 2050 & `2' <= 2059
	qui replace `1' = 2 if `2' >= 2060 & `2' <= 2063
	qui replace `1' = 2 if `2' >= 2070 & `2' <= 2079
	qui replace `1' = 2 if `2' >= 2090 & `2' <= 2092
	qui replace `1' = 2 if `2' >= 2095 & `2' <= 2095
	qui replace `1' = 2 if `2' >= 2098 & `2' <= 2099
	
	qui replace `1' = 3 if `2' >= 2064 & `2' <= 2068
	qui replace `1' = 3 if `2' >= 2086 & `2' <= 2086
	qui replace `1' = 3 if `2' >= 2087 & `2' <= 2087
	qui replace `1' = 3 if `2' >= 2096 & `2' <= 2096
	qui replace `1' = 3 if `2' >= 2097 & `2' <= 2097
	
	qui replace `1' = 4 if `2' >= 2080 & `2' <= 2080
	qui replace `1' = 4 if `2' >= 2082 & `2' <= 2082
	qui replace `1' = 4 if `2' >= 2083 & `2' <= 2083
	qui replace `1' = 4 if `2' >= 2084 & `2' <= 2084
	qui replace `1' = 4 if `2' >= 2085 & `2' <= 2085
	
	qui replace `1' = 5 if `2' >= 2100 & `2' <= 2199
	
	qui replace `1' = 6 if `2' >= 0920 & `2' <= 0999
	qui replace `1' = 6 if `2' >= 3650 & `2' <= 3651
	qui replace `1' = 6 if `2' >= 3652 & `2' <= 3652
	qui replace `1' = 6 if `2' >= 3732 & `2' <= 3732
	qui replace `1' = 6 if `2' >= 3930 & `2' <= 3931
	qui replace `1' = 6 if `2' >= 3940 & `2' <= 3949
	
	qui replace `1' = 7 if `2' >= 7800 & `2' <= 7829
	qui replace `1' = 7 if `2' >= 7830 & `2' <= 7833
	qui replace `1' = 7 if `2' >= 7840 & `2' <= 7841
	qui replace `1' = 7 if `2' >= 7900 & `2' <= 7900
	qui replace `1' = 7 if `2' >= 7910 & `2' <= 7911
	qui replace `1' = 7 if `2' >= 7920 & `2' <= 7929
	qui replace `1' = 7 if `2' >= 7930 & `2' <= 7933
	qui replace `1' = 7 if `2' >= 7940 & `2' <= 7949
	qui replace `1' = 7 if `2' >= 7980 & `2' <= 7980
	qui replace `1' = 7 if `2' >= 7990 & `2' <= 7999
	
	qui replace `1' = 8 if `2' >= 2700 & `2' <= 2709
	qui replace `1' = 8 if `2' >= 2710 & `2' <= 2719
	qui replace `1' = 8 if `2' >= 2720 & `2' <= 2729
	qui replace `1' = 8 if `2' >= 2730 & `2' <= 2739
	qui replace `1' = 8 if `2' >= 2740 & `2' <= 2749
	qui replace `1' = 8 if `2' >= 2770 & `2' <= 2771
	qui replace `1' = 8 if `2' >= 2780 & `2' <= 2789
	qui replace `1' = 8 if `2' >= 2790 & `2' <= 2799
	
	qui replace `1' = 9 if `2' >= 2047 & `2' <= 2047
	qui replace `1' = 9 if `2' >= 2391 & `2' <= 2392
	qui replace `1' = 9 if `2' >= 2510 & `2' <= 2519
	qui replace `1' = 9 if `2' >= 2590 & `2' <= 2599
	qui replace `1' = 9 if `2' >= 2840 & `2' <= 2843
	qui replace `1' = 9 if `2' >= 2844 & `2' <= 2844
	qui replace `1' = 9 if `2' >= 3160 & `2' <= 3161
	qui replace `1' = 9 if `2' >= 3170 & `2' <= 3171
	qui replace `1' = 9 if `2' >= 3172 & `2' <= 3172
	qui replace `1' = 9 if `2' >= 3190 & `2' <= 3199
	qui replace `1' = 9 if `2' >= 3229 & `2' <= 3229
	qui replace `1' = 9 if `2' >= 3260 & `2' <= 3260
	qui replace `1' = 9 if `2' >= 3262 & `2' <= 3263
	qui replace `1' = 9 if `2' >= 3269 & `2' <= 3269
	qui replace `1' = 9 if `2' >= 3230 & `2' <= 3231
	qui replace `1' = 9 if `2' >= 3630 & `2' <= 3639
	qui replace `1' = 9 if `2' >= 3750 & `2' <= 3751
	qui replace `1' = 9 if `2' >= 3800 & `2' <= 3800
	qui replace `1' = 9 if `2' >= 3860 & `2' <= 3861
	qui replace `1' = 9 if `2' >= 3870 & `2' <= 3873
	qui replace `1' = 9 if `2' >= 3910 & `2' <= 3911
	qui replace `1' = 9 if `2' >= 3914 & `2' <= 3914
	qui replace `1' = 9 if `2' >= 3915 & `2' <= 3915
	qui replace `1' = 9 if `2' >= 3960 & `2' <= 3962
	qui replace `1' = 9 if `2' >= 3991 & `2' <= 3991
	qui replace `1' = 9 if `2' >= 3995 & `2' <= 3995
	
	qui replace `1' = 10 if `2' >= 2300 & `2' <= 2390
	qui replace `1' = 10 if `2' >= 3020 & `2' <= 3021
	qui replace `1' = 10 if `2' >= 3100 & `2' <= 3111
	qui replace `1' = 10 if `2' >= 3130 & `2' <= 3131
	qui replace `1' = 10 if `2' >= 3140 & `2' <= 3149
	qui replace `1' = 10 if `2' >= 3150 & `2' <= 3151
	qui replace `1' = 10 if `2' >= 3963 & `2' <= 3965
	
	qui replace `1' = 11 if `2' >= 8000 & `2' <= 8099
	
	qui replace `1' = 12 if `2' >= 3693 & `2' <= 3693
	qui replace `1' = 12 if `2' >= 3840 & `2' <= 3849
	qui replace `1' = 12 if `2' >= 3850 & `2' <= 3851
	
	qui replace `1' = 13 if `2' >= 2830 & `2' <= 2830
	qui replace `1' = 13 if `2' >= 2831 & `2' <= 2831
	qui replace `1' = 13 if `2' >= 2833 & `2' <= 2833
	qui replace `1' = 13 if `2' >= 2834 & `2' <= 2834
	qui replace `1' = 13 if `2' >= 2835 & `2' <= 2835
	qui replace `1' = 13 if `2' >= 2836 & `2' <= 2836
	
	qui replace `1' = 14 if `2' >= 2800 & `2' <= 2809
	qui replace `1' = 14 if `2' >= 2810 & `2' <= 2819
	qui replace `1' = 14 if `2' >= 2820 & `2' <= 2829
	qui replace `1' = 14 if `2' >= 2850 & `2' <= 2859
	qui replace `1' = 14 if `2' >= 2860 & `2' <= 2869
	qui replace `1' = 14 if `2' >= 2870 & `2' <= 2879
	qui replace `1' = 14 if `2' >= 2890 & `2' <= 2899
	
	qui replace `1' = 15 if `2' >= 3031 & `2' <= 3031
	qui replace `1' = 15 if `2' >= 3041 & `2' <= 3041
	qui replace `1' = 15 if `2' >= 3050 & `2' <= 3053
	qui replace `1' = 15 if `2' >= 3060 & `2' <= 3069
	qui replace `1' = 15 if `2' >= 3070 & `2' <= 3079
	qui replace `1' = 15 if `2' >= 3080 & `2' <= 3089
	qui replace `1' = 15 if `2' >= 3090 & `2' <= 3099
	
	qui replace `1' = 16 if `2' >= 2200 & `2' <= 2269
	qui replace `1' = 16 if `2' >= 2270 & `2' <= 2279
	qui replace `1' = 16 if `2' >= 2280 & `2' <= 2284
	qui replace `1' = 16 if `2' >= 2290 & `2' <= 2295
	qui replace `1' = 16 if `2' >= 2297 & `2' <= 2297
	qui replace `1' = 16 if `2' >= 2298 & `2' <= 2298
	qui replace `1' = 16 if `2' >= 2299 & `2' <= 2299
	qui replace `1' = 16 if `2' >= 2393 & `2' <= 2395
	qui replace `1' = 16 if `2' >= 2397 & `2' <= 2399
	
	qui replace `1' = 17 if `2' >= 0800 & `2' <= 0899
	qui replace `1' = 17 if `2' >= 2400 & `2' <= 2439
	qui replace `1' = 17 if `2' >= 2450 & `2' <= 2459
	qui replace `1' = 17 if `2' >= 2490 & `2' <= 2499
	qui replace `1' = 17 if `2' >= 2660 & `2' <= 2661
	qui replace `1' = 17 if `2' >= 2950 & `2' <= 2952
	qui replace `1' = 17 if `2' >= 3200 & `2' <= 3200
	qui replace `1' = 17 if `2' >= 3210 & `2' <= 3211
	qui replace `1' = 17 if `2' >= 3240 & `2' <= 3241
	qui replace `1' = 17 if `2' >= 3250 & `2' <= 3259
	qui replace `1' = 17 if `2' >= 3261 & `2' <= 3261
	qui replace `1' = 17 if `2' >= 3264 & `2' <= 3264
	qui replace `1' = 17 if `2' >= 3270 & `2' <= 3275
	qui replace `1' = 17 if `2' >= 3280 & `2' <= 3281
	qui replace `1' = 17 if `2' >= 3290 & `2' <= 3293
	qui replace `1' = 17 if `2' >= 3295 & `2' <= 3299
	qui replace `1' = 17 if `2' >= 3420 & `2' <= 3429
	qui replace `1' = 17 if `2' >= 3430 & `2' <= 3433
	qui replace `1' = 17 if `2' >= 3440 & `2' <= 3441
	qui replace `1' = 17 if `2' >= 3442 & `2' <= 3442
	qui replace `1' = 17 if `2' >= 3446 & `2' <= 3446
	qui replace `1' = 17 if `2' >= 3448 & `2' <= 3448
	qui replace `1' = 17 if `2' >= 3449 & `2' <= 3449
	qui replace `1' = 17 if `2' >= 3450 & `2' <= 3451
	qui replace `1' = 17 if `2' >= 3452 & `2' <= 3452
	qui replace `1' = 17 if `2' >= 3490 & `2' <= 3499
	qui replace `1' = 17 if `2' >= 3996 & `2' <= 3996
	
	qui replace `1' = 18 if `2' >= 1500 & `2' <= 1511
	qui replace `1' = 18 if `2' >= 1520 & `2' <= 1529
	qui replace `1' = 18 if `2' >= 1530 & `2' <= 1539
	qui replace `1' = 18 if `2' >= 1540 & `2' <= 1549
	qui replace `1' = 18 if `2' >= 1600 & `2' <= 1699
	qui replace `1' = 18 if `2' >= 1700 & `2' <= 1799
	
	qui replace `1' = 19 if `2' >= 3300 & `2' <= 3300
	qui replace `1' = 19 if `2' >= 3310 & `2' <= 3317
	qui replace `1' = 19 if `2' >= 3320 & `2' <= 3325
	qui replace `1' = 19 if `2' >= 3330 & `2' <= 3339
	qui replace `1' = 19 if `2' >= 3340 & `2' <= 3341
	qui replace `1' = 19 if `2' >= 3350 & `2' <= 3357
	qui replace `1' = 19 if `2' >= 3360 & `2' <= 3369
	qui replace `1' = 19 if `2' >= 3370 & `2' <= 3379
	qui replace `1' = 19 if `2' >= 3390 & `2' <= 3399
	
	qui replace `1' = 20 if `2' >= 3400 & `2' <= 3400
	qui replace `1' = 20 if `2' >= 3443 & `2' <= 3443
	qui replace `1' = 20 if `2' >= 3444 & `2' <= 3444
	qui replace `1' = 20 if `2' >= 3460 & `2' <= 3469
	qui replace `1' = 20 if `2' >= 3470 & `2' <= 3479
	
	qui replace `1' = 21 if `2' >= 3510 & `2' <= 3519
	qui replace `1' = 21 if `2' >= 3520 & `2' <= 3529
	qui replace `1' = 21 if `2' >= 3530 & `2' <= 3530
	qui replace `1' = 21 if `2' >= 3531 & `2' <= 3531
	qui replace `1' = 21 if `2' >= 3532 & `2' <= 3532
	qui replace `1' = 21 if `2' >= 3533 & `2' <= 3533
	qui replace `1' = 21 if `2' >= 3534 & `2' <= 3534
	qui replace `1' = 21 if `2' >= 3535 & `2' <= 3535
	qui replace `1' = 21 if `2' >= 3536 & `2' <= 3536
	qui replace `1' = 21 if `2' >= 3538 & `2' <= 3538
	qui replace `1' = 21 if `2' >= 3540 & `2' <= 3549
	qui replace `1' = 21 if `2' >= 3550 & `2' <= 3559
	qui replace `1' = 21 if `2' >= 3560 & `2' <= 3569
	qui replace `1' = 21 if `2' >= 3580 & `2' <= 3580
	qui replace `1' = 21 if `2' >= 3581 & `2' <= 3581
	qui replace `1' = 21 if `2' >= 3582 & `2' <= 3582
	qui replace `1' = 21 if `2' >= 3585 & `2' <= 3585
	qui replace `1' = 21 if `2' >= 3586 & `2' <= 3586
	qui replace `1' = 21 if `2' >= 3589 & `2' <= 3589
	qui replace `1' = 21 if `2' >= 3590 & `2' <= 3599
	
	qui replace `1' = 22 if `2' >= 3600 & `2' <= 3600
	qui replace `1' = 22 if `2' >= 3610 & `2' <= 3613
	qui replace `1' = 22 if `2' >= 3620 & `2' <= 3621
	qui replace `1' = 22 if `2' >= 3623 & `2' <= 3629
	qui replace `1' = 22 if `2' >= 3640 & `2' <= 3644
	qui replace `1' = 22 if `2' >= 3645 & `2' <= 3645
	qui replace `1' = 22 if `2' >= 3646 & `2' <= 3646
	qui replace `1' = 22 if `2' >= 3648 & `2' <= 3649
	qui replace `1' = 22 if `2' >= 3660 & `2' <= 3660
	qui replace `1' = 22 if `2' >= 3690 & `2' <= 3690
	qui replace `1' = 22 if `2' >= 3691 & `2' <= 3692
	qui replace `1' = 22 if `2' >= 3699 & `2' <= 3699
	
	qui replace `1' = 23 if `2' >= 2296 & `2' <= 2296
	qui replace `1' = 23 if `2' >= 2396 & `2' <= 2396
	qui replace `1' = 23 if `2' >= 3010 & `2' <= 3011
	qui replace `1' = 23 if `2' >= 3537 & `2' <= 3537
	qui replace `1' = 23 if `2' >= 3647 & `2' <= 3647
	qui replace `1' = 23 if `2' >= 3694 & `2' <= 3694
	qui replace `1' = 23 if `2' >= 3700 & `2' <= 3700
	qui replace `1' = 23 if `2' >= 3710 & `2' <= 3710
	qui replace `1' = 23 if `2' >= 3711 & `2' <= 3711
	qui replace `1' = 23 if `2' >= 3713 & `2' <= 3713
	qui replace `1' = 23 if `2' >= 3714 & `2' <= 3714
	qui replace `1' = 23 if `2' >= 3715 & `2' <= 3715
	qui replace `1' = 23 if `2' >= 3716 & `2' <= 3716
	qui replace `1' = 23 if `2' >= 3792 & `2' <= 3792
	qui replace `1' = 23 if `2' >= 3790 & `2' <= 3791
	qui replace `1' = 23 if `2' >= 3799 & `2' <= 3799
	
	qui replace `1' = 24 if `2' >= 3720 & `2' <= 3720
	qui replace `1' = 24 if `2' >= 3721 & `2' <= 3721
	qui replace `1' = 24 if `2' >= 3723 & `2' <= 3724
	qui replace `1' = 24 if `2' >= 3725 & `2' <= 3725
	qui replace `1' = 24 if `2' >= 3728 & `2' <= 3729
	
	qui replace `1' = 25 if `2' >= 3730 & `2' <= 3731
	qui replace `1' = 25 if `2' >= 3740 & `2' <= 3743
	
	qui replace `1' = 26 if `2' >= 3760 & `2' <= 3769
	qui replace `1' = 26 if `2' >= 3795 & `2' <= 3795
	qui replace `1' = 26 if `2' >= 3480 & `2' <= 3489
	
	qui replace `1' = 27 if `2' >= 1040 & `2' <= 1049
	
	qui replace `1' = 28 if `2' >= 1000 & `2' <= 1009
	qui replace `1' = 28 if `2' >= 1010 & `2' <= 1019
	qui replace `1' = 28 if `2' >= 1020 & `2' <= 1029
	qui replace `1' = 28 if `2' >= 1030 & `2' <= 1039
	qui replace `1' = 28 if `2' >= 1050 & `2' <= 1059
	qui replace `1' = 28 if `2' >= 1060 & `2' <= 1069
	qui replace `1' = 28 if `2' >= 1070 & `2' <= 1079
	qui replace `1' = 28 if `2' >= 1080 & `2' <= 1089
	qui replace `1' = 28 if `2' >= 1090 & `2' <= 1099
	qui replace `1' = 28 if `2' >= 1100 & `2' <= 1119
	qui replace `1' = 28 if `2' >= 1400 & `2' <= 1499
	
	qui replace `1' = 29 if `2' >= 1200 & `2' <= 1299
	
	qui replace `1' = 30 if `2' >= 1300 & `2' <= 1300
	qui replace `1' = 30 if `2' >= 1310 & `2' <= 1319
	qui replace `1' = 30 if `2' >= 1320 & `2' <= 1329
	qui replace `1' = 30 if `2' >= 1330 & `2' <= 1339
	qui replace `1' = 30 if `2' >= 1370 & `2' <= 1379
	qui replace `1' = 30 if `2' >= 1380 & `2' <= 1380
	qui replace `1' = 30 if `2' >= 1381 & `2' <= 1381
	qui replace `1' = 30 if `2' >= 1382 & `2' <= 1382
	qui replace `1' = 30 if `2' >= 1389 & `2' <= 1389
	qui replace `1' = 30 if `2' >= 2900 & `2' <= 2912
	qui replace `1' = 30 if `2' >= 2990 & `2' <= 2999
	
	qui replace `1' = 31 if `2' >= 4900 & `2' <= 4900
	qui replace `1' = 31 if `2' >= 4910 & `2' <= 4911
	qui replace `1' = 31 if `2' >= 4920 & `2' <= 4922
	qui replace `1' = 31 if `2' >= 4923 & `2' <= 4923
	qui replace `1' = 31 if `2' >= 4924 & `2' <= 4925
	qui replace `1' = 31 if `2' >= 4930 & `2' <= 4931
	qui replace `1' = 31 if `2' >= 4932 & `2' <= 4932
	qui replace `1' = 31 if `2' >= 4939 & `2' <= 4939
	qui replace `1' = 31 if `2' >= 4940 & `2' <= 4942
	
	qui replace `1' = 32 if `2' >= 4800 & `2' <= 4800
	qui replace `1' = 32 if `2' >= 4810 & `2' <= 4813
	qui replace `1' = 32 if `2' >= 4820 & `2' <= 4822
	qui replace `1' = 32 if `2' >= 4830 & `2' <= 4839
	qui replace `1' = 32 if `2' >= 4840 & `2' <= 4841
	qui replace `1' = 32 if `2' >= 4880 & `2' <= 4889
	qui replace `1' = 32 if `2' >= 4890 & `2' <= 4890
	qui replace `1' = 32 if `2' >= 4891 & `2' <= 4891
	qui replace `1' = 32 if `2' >= 4892 & `2' <= 4892
	qui replace `1' = 32 if `2' >= 4899 & `2' <= 4899
	
	qui replace `1' = 33 if `2' >= 7020 & `2' <= 7021
	qui replace `1' = 33 if `2' >= 7030 & `2' <= 7033
	qui replace `1' = 33 if `2' >= 7200 & `2' <= 7200
	qui replace `1' = 33 if `2' >= 7210 & `2' <= 7212
	qui replace `1' = 33 if `2' >= 7214 & `2' <= 7214
	qui replace `1' = 33 if `2' >= 7215 & `2' <= 7216
	qui replace `1' = 33 if `2' >= 7217 & `2' <= 7217
	qui replace `1' = 33 if `2' >= 7219 & `2' <= 7219
	qui replace `1' = 33 if `2' >= 7220 & `2' <= 7221
	qui replace `1' = 33 if `2' >= 7230 & `2' <= 7231
	qui replace `1' = 33 if `2' >= 7240 & `2' <= 7241
	qui replace `1' = 33 if `2' >= 7250 & `2' <= 7251
	qui replace `1' = 33 if `2' >= 7260 & `2' <= 7269
	qui replace `1' = 33 if `2' >= 7270 & `2' <= 7290
	qui replace `1' = 33 if `2' >= 7291 & `2' <= 7291
	qui replace `1' = 33 if `2' >= 7292 & `2' <= 7299
	qui replace `1' = 33 if `2' >= 7395 & `2' <= 7395
	qui replace `1' = 33 if `2' >= 7500 & `2' <= 7500
	qui replace `1' = 33 if `2' >= 7520 & `2' <= 7529
	qui replace `1' = 33 if `2' >= 7530 & `2' <= 7539
	qui replace `1' = 33 if `2' >= 7540 & `2' <= 7549
	qui replace `1' = 33 if `2' >= 7600 & `2' <= 7600
	qui replace `1' = 33 if `2' >= 7620 & `2' <= 7620
	qui replace `1' = 33 if `2' >= 7622 & `2' <= 7622
	qui replace `1' = 33 if `2' >= 7623 & `2' <= 7623
	qui replace `1' = 33 if `2' >= 7629 & `2' <= 7629
	qui replace `1' = 33 if `2' >= 7630 & `2' <= 7631
	qui replace `1' = 33 if `2' >= 7640 & `2' <= 7641
	qui replace `1' = 33 if `2' >= 7690 & `2' <= 7699
	qui replace `1' = 33 if `2' >= 8100 & `2' <= 8199
	qui replace `1' = 33 if `2' >= 8200 & `2' <= 8299
	qui replace `1' = 33 if `2' >= 8300 & `2' <= 8399
	qui replace `1' = 33 if `2' >= 8400 & `2' <= 8499
	qui replace `1' = 33 if `2' >= 8600 & `2' <= 8699
	qui replace `1' = 33 if `2' >= 8800 & `2' <= 8899
	qui replace `1' = 33 if `2' >= 7510 & `2' <= 7515
	
	qui replace `1' = 34 if `2' >= 2750 & `2' <= 2759
	qui replace `1' = 34 if `2' >= 3993 & `2' <= 3993
	qui replace `1' = 34 if `2' >= 7218 & `2' <= 7218
	qui replace `1' = 34 if `2' >= 7300 & `2' <= 7300
	qui replace `1' = 34 if `2' >= 7310 & `2' <= 7319
	qui replace `1' = 34 if `2' >= 7320 & `2' <= 7329
	qui replace `1' = 34 if `2' >= 7330 & `2' <= 7339
	qui replace `1' = 34 if `2' >= 7340 & `2' <= 7342
	qui replace `1' = 34 if `2' >= 7349 & `2' <= 7349
	qui replace `1' = 34 if `2' >= 7350 & `2' <= 7351
	qui replace `1' = 34 if `2' >= 7352 & `2' <= 7352
	qui replace `1' = 34 if `2' >= 7353 & `2' <= 7353
	qui replace `1' = 34 if `2' >= 7359 & `2' <= 7359
	qui replace `1' = 34 if `2' >= 7360 & `2' <= 7369
	qui replace `1' = 34 if `2' >= 7370 & `2' <= 7372
	qui replace `1' = 34 if `2' >= 7374 & `2' <= 7374
	qui replace `1' = 34 if `2' >= 7375 & `2' <= 7375
	qui replace `1' = 34 if `2' >= 7376 & `2' <= 7376
	qui replace `1' = 34 if `2' >= 7377 & `2' <= 7377
	qui replace `1' = 34 if `2' >= 7378 & `2' <= 7378
	qui replace `1' = 34 if `2' >= 7379 & `2' <= 7379
	qui replace `1' = 34 if `2' >= 7380 & `2' <= 7380
	qui replace `1' = 34 if `2' >= 7381 & `2' <= 7382
	qui replace `1' = 34 if `2' >= 7383 & `2' <= 7383
	qui replace `1' = 34 if `2' >= 7384 & `2' <= 7384
	qui replace `1' = 34 if `2' >= 7385 & `2' <= 7385
	qui replace `1' = 34 if `2' >= 7389 & `2' <= 7390
	qui replace `1' = 34 if `2' >= 7391 & `2' <= 7391
	qui replace `1' = 34 if `2' >= 7392 & `2' <= 7392
	qui replace `1' = 34 if `2' >= 7393 & `2' <= 7393
	qui replace `1' = 34 if `2' >= 7394 & `2' <= 7394
	qui replace `1' = 34 if `2' >= 7396 & `2' <= 7396
	qui replace `1' = 34 if `2' >= 7397 & `2' <= 7397
	qui replace `1' = 34 if `2' >= 7399 & `2' <= 7399
	qui replace `1' = 34 if `2' >= 7519 & `2' <= 7519
	qui replace `1' = 34 if `2' >= 8700 & `2' <= 8700
	qui replace `1' = 34 if `2' >= 8710 & `2' <= 8713
	qui replace `1' = 34 if `2' >= 8720 & `2' <= 8721
	qui replace `1' = 34 if `2' >= 8730 & `2' <= 8734
	qui replace `1' = 34 if `2' >= 8740 & `2' <= 8748
	qui replace `1' = 34 if `2' >= 8900 & `2' <= 8910
	qui replace `1' = 34 if `2' >= 8911 & `2' <= 8911
	qui replace `1' = 34 if `2' >= 8920 & `2' <= 8999
	qui replace `1' = 34 if `2' >= 4220 & `2' <= 4229
	
	qui replace `1' = 35 if `2' >= 3570 & `2' <= 3579
	qui replace `1' = 35 if `2' >= 3680 & `2' <= 3680
	qui replace `1' = 35 if `2' >= 3681 & `2' <= 3681
	qui replace `1' = 35 if `2' >= 3682 & `2' <= 3682
	qui replace `1' = 35 if `2' >= 3683 & `2' <= 3683
	qui replace `1' = 35 if `2' >= 3684 & `2' <= 3684
	qui replace `1' = 35 if `2' >= 3685 & `2' <= 3685
	qui replace `1' = 35 if `2' >= 3686 & `2' <= 3686
	qui replace `1' = 35 if `2' >= 3687 & `2' <= 3687
	qui replace `1' = 35 if `2' >= 3688 & `2' <= 3688
	qui replace `1' = 35 if `2' >= 3689 & `2' <= 3689
	qui replace `1' = 35 if `2' >= 3695 & `2' <= 3695
	qui replace `1' = 35 if `2' >= 7373 & `2' <= 7373
	
	qui replace `1' = 36 if `2' >= 3622 & `2' <= 3622
	qui replace `1' = 36 if `2' >= 3661 & `2' <= 3661
	qui replace `1' = 36 if `2' >= 3662 & `2' <= 3662
	qui replace `1' = 36 if `2' >= 3663 & `2' <= 3663
	qui replace `1' = 36 if `2' >= 3664 & `2' <= 3664
	qui replace `1' = 36 if `2' >= 3665 & `2' <= 3665
	qui replace `1' = 36 if `2' >= 3666 & `2' <= 3666
	qui replace `1' = 36 if `2' >= 3669 & `2' <= 3669
	qui replace `1' = 36 if `2' >= 3670 & `2' <= 3679
	qui replace `1' = 36 if `2' >= 3810 & `2' <= 3810
	qui replace `1' = 36 if `2' >= 3812 & `2' <= 3812
	
	qui replace `1' = 37 if `2' >= 3811 & `2' <= 3811
	qui replace `1' = 37 if `2' >= 3820 & `2' <= 3820
	qui replace `1' = 37 if `2' >= 3821 & `2' <= 3821
	qui replace `1' = 37 if `2' >= 3822 & `2' <= 3822
	qui replace `1' = 37 if `2' >= 3823 & `2' <= 3823
	qui replace `1' = 37 if `2' >= 3824 & `2' <= 3824
	qui replace `1' = 37 if `2' >= 3825 & `2' <= 3825
	qui replace `1' = 37 if `2' >= 3826 & `2' <= 3826
	qui replace `1' = 37 if `2' >= 3827 & `2' <= 3827
	qui replace `1' = 37 if `2' >= 3829 & `2' <= 3829
	qui replace `1' = 37 if `2' >= 3830 & `2' <= 3839
	
	qui replace `1' = 38 if `2' >= 2520 & `2' <= 2549
	qui replace `1' = 38 if `2' >= 2600 & `2' <= 2639
	qui replace `1' = 38 if `2' >= 2670 & `2' <= 2699
	qui replace `1' = 38 if `2' >= 2760 & `2' <= 2761
	qui replace `1' = 38 if `2' >= 3950 & `2' <= 3955
	
	qui replace `1' = 39 if `2' >= 2440 & `2' <= 2449
	qui replace `1' = 39 if `2' >= 2640 & `2' <= 2659
	qui replace `1' = 39 if `2' >= 3220 & `2' <= 3221
	qui replace `1' = 39 if `2' >= 3410 & `2' <= 3412
	
	qui replace `1' = 40 if `2' >= 4000 & `2' <= 4013
	qui replace `1' = 40 if `2' >= 4040 & `2' <= 4049
	qui replace `1' = 40 if `2' >= 4100 & `2' <= 4100
	qui replace `1' = 40 if `2' >= 4110 & `2' <= 4119
	qui replace `1' = 40 if `2' >= 4120 & `2' <= 4121
	qui replace `1' = 40 if `2' >= 4130 & `2' <= 4131
	qui replace `1' = 40 if `2' >= 4140 & `2' <= 4142
	qui replace `1' = 40 if `2' >= 4150 & `2' <= 4151
	qui replace `1' = 40 if `2' >= 4170 & `2' <= 4173
	qui replace `1' = 40 if `2' >= 4190 & `2' <= 4199
	qui replace `1' = 40 if `2' >= 4200 & `2' <= 4200
	qui replace `1' = 40 if `2' >= 4210 & `2' <= 4219
	qui replace `1' = 40 if `2' >= 4230 & `2' <= 4231
	qui replace `1' = 40 if `2' >= 4240 & `2' <= 4249
	qui replace `1' = 40 if `2' >= 4400 & `2' <= 4499
	qui replace `1' = 40 if `2' >= 4500 & `2' <= 4599
	qui replace `1' = 40 if `2' >= 4600 & `2' <= 4699
	qui replace `1' = 40 if `2' >= 4700 & `2' <= 4700
	qui replace `1' = 40 if `2' >= 4710 & `2' <= 4712
	qui replace `1' = 40 if `2' >= 4720 & `2' <= 4729
	qui replace `1' = 40 if `2' >= 4730 & `2' <= 4739
	qui replace `1' = 40 if `2' >= 4740 & `2' <= 4749
	qui replace `1' = 40 if `2' >= 4780 & `2' <= 4780
	qui replace `1' = 40 if `2' >= 4782 & `2' <= 4782
	qui replace `1' = 40 if `2' >= 4783 & `2' <= 4783
	qui replace `1' = 40 if `2' >= 4784 & `2' <= 4784
	qui replace `1' = 40 if `2' >= 4785 & `2' <= 4785
	qui replace `1' = 40 if `2' >= 4789 & `2' <= 4789
	
	qui replace `1' = 41 if `2' >= 5000 & `2' <= 5000
	qui replace `1' = 41 if `2' >= 5010 & `2' <= 5015
	qui replace `1' = 41 if `2' >= 5020 & `2' <= 5023
	qui replace `1' = 41 if `2' >= 5030 & `2' <= 5039
	qui replace `1' = 41 if `2' >= 5040 & `2' <= 5042
	qui replace `1' = 41 if `2' >= 5043 & `2' <= 5043
	qui replace `1' = 41 if `2' >= 5044 & `2' <= 5044
	qui replace `1' = 41 if `2' >= 5045 & `2' <= 5045
	qui replace `1' = 41 if `2' >= 5046 & `2' <= 5046
	qui replace `1' = 41 if `2' >= 5047 & `2' <= 5047
	qui replace `1' = 41 if `2' >= 5048 & `2' <= 5048
	qui replace `1' = 41 if `2' >= 5049 & `2' <= 5049
	qui replace `1' = 41 if `2' >= 5050 & `2' <= 5059
	qui replace `1' = 41 if `2' >= 5060 & `2' <= 5060
	qui replace `1' = 41 if `2' >= 5063 & `2' <= 5063
	qui replace `1' = 41 if `2' >= 5064 & `2' <= 5064
	qui replace `1' = 41 if `2' >= 5065 & `2' <= 5065
	qui replace `1' = 41 if `2' >= 5070 & `2' <= 5078
	qui replace `1' = 41 if `2' >= 5080 & `2' <= 5080
	qui replace `1' = 41 if `2' >= 5081 & `2' <= 5081
	qui replace `1' = 41 if `2' >= 5082 & `2' <= 5082
	qui replace `1' = 41 if `2' >= 5083 & `2' <= 5083
	qui replace `1' = 41 if `2' >= 5084 & `2' <= 5084
	qui replace `1' = 41 if `2' >= 5085 & `2' <= 5085
	qui replace `1' = 41 if `2' >= 5086 & `2' <= 5087
	qui replace `1' = 41 if `2' >= 5088 & `2' <= 5088
	qui replace `1' = 41 if `2' >= 5090 & `2' <= 5090
	qui replace `1' = 41 if `2' >= 5091 & `2' <= 5092
	qui replace `1' = 41 if `2' >= 5093 & `2' <= 5093
	qui replace `1' = 41 if `2' >= 5094 & `2' <= 5094
	qui replace `1' = 41 if `2' >= 5099 & `2' <= 5099
	qui replace `1' = 41 if `2' >= 5100 & `2' <= 5100
	qui replace `1' = 41 if `2' >= 5110 & `2' <= 5113
	qui replace `1' = 41 if `2' >= 5120 & `2' <= 5122
	qui replace `1' = 41 if `2' >= 5130 & `2' <= 5139
	qui replace `1' = 41 if `2' >= 5140 & `2' <= 5149
	qui replace `1' = 41 if `2' >= 5150 & `2' <= 5159
	qui replace `1' = 41 if `2' >= 5160 & `2' <= 5169
	qui replace `1' = 41 if `2' >= 5170 & `2' <= 5172
	qui replace `1' = 41 if `2' >= 5180 & `2' <= 5182
	qui replace `1' = 41 if `2' >= 5190 & `2' <= 5199
	
	qui replace `1' = 42 if `2' >= 5200 & `2' <= 5200
	qui replace `1' = 42 if `2' >= 5210 & `2' <= 5219
	qui replace `1' = 42 if `2' >= 5220 & `2' <= 5229
	qui replace `1' = 42 if `2' >= 5230 & `2' <= 5231
	qui replace `1' = 42 if `2' >= 5250 & `2' <= 5251
	qui replace `1' = 42 if `2' >= 5260 & `2' <= 5261
	qui replace `1' = 42 if `2' >= 5270 & `2' <= 5271
	qui replace `1' = 42 if `2' >= 5300 & `2' <= 5300
	qui replace `1' = 42 if `2' >= 5310 & `2' <= 5311
	qui replace `1' = 42 if `2' >= 5320 & `2' <= 5320
	qui replace `1' = 42 if `2' >= 5330 & `2' <= 5331
	qui replace `1' = 42 if `2' >= 5334 & `2' <= 5334
	qui replace `1' = 42 if `2' >= 5340 & `2' <= 5349
	qui replace `1' = 42 if `2' >= 5390 & `2' <= 5399
	qui replace `1' = 42 if `2' >= 5400 & `2' <= 5400
	qui replace `1' = 42 if `2' >= 5410 & `2' <= 5411
	qui replace `1' = 42 if `2' >= 5412 & `2' <= 5412
	qui replace `1' = 42 if `2' >= 5420 & `2' <= 5429
	qui replace `1' = 42 if `2' >= 5430 & `2' <= 5439
	qui replace `1' = 42 if `2' >= 5440 & `2' <= 5449
	qui replace `1' = 42 if `2' >= 5450 & `2' <= 5459
	qui replace `1' = 42 if `2' >= 5460 & `2' <= 5469
	qui replace `1' = 42 if `2' >= 5490 & `2' <= 5499
	qui replace `1' = 42 if `2' >= 5500 & `2' <= 5500
	qui replace `1' = 42 if `2' >= 5510 & `2' <= 5529
	qui replace `1' = 42 if `2' >= 5530 & `2' <= 5539
	qui replace `1' = 42 if `2' >= 5540 & `2' <= 5549
	qui replace `1' = 42 if `2' >= 5550 & `2' <= 5559
	qui replace `1' = 42 if `2' >= 5560 & `2' <= 5569
	qui replace `1' = 42 if `2' >= 5570 & `2' <= 5579
	qui replace `1' = 42 if `2' >= 5590 & `2' <= 5599
	qui replace `1' = 42 if `2' >= 5600 & `2' <= 5699
	qui replace `1' = 42 if `2' >= 5700 & `2' <= 5700
	qui replace `1' = 42 if `2' >= 5710 & `2' <= 5719
	qui replace `1' = 42 if `2' >= 5720 & `2' <= 5722
	qui replace `1' = 42 if `2' >= 5730 & `2' <= 5733
	qui replace `1' = 42 if `2' >= 5734 & `2' <= 5734
	qui replace `1' = 42 if `2' >= 5735 & `2' <= 5735
	qui replace `1' = 42 if `2' >= 5736 & `2' <= 5736
	qui replace `1' = 42 if `2' >= 5750 & `2' <= 5799
	qui replace `1' = 42 if `2' >= 5900 & `2' <= 5900
	qui replace `1' = 42 if `2' >= 5910 & `2' <= 5912
	qui replace `1' = 42 if `2' >= 5920 & `2' <= 5929
	qui replace `1' = 42 if `2' >= 5930 & `2' <= 5932
	qui replace `1' = 42 if `2' >= 5940 & `2' <= 5940
	qui replace `1' = 42 if `2' >= 5941 & `2' <= 5941
	qui replace `1' = 42 if `2' >= 5942 & `2' <= 5942
	qui replace `1' = 42 if `2' >= 5943 & `2' <= 5943
	qui replace `1' = 42 if `2' >= 5944 & `2' <= 5944
	qui replace `1' = 42 if `2' >= 5945 & `2' <= 5945
	qui replace `1' = 42 if `2' >= 5946 & `2' <= 5946
	qui replace `1' = 42 if `2' >= 5947 & `2' <= 5947
	qui replace `1' = 42 if `2' >= 5948 & `2' <= 5948
	qui replace `1' = 42 if `2' >= 5949 & `2' <= 5949
	qui replace `1' = 42 if `2' >= 5950 & `2' <= 5959
	qui replace `1' = 42 if `2' >= 5960 & `2' <= 5969
	qui replace `1' = 42 if `2' >= 5970 & `2' <= 5979
	qui replace `1' = 42 if `2' >= 5980 & `2' <= 5989
	qui replace `1' = 42 if `2' >= 5990 & `2' <= 5990
	qui replace `1' = 42 if `2' >= 5992 & `2' <= 5992
	qui replace `1' = 42 if `2' >= 5993 & `2' <= 5993
	qui replace `1' = 42 if `2' >= 5994 & `2' <= 5994
	qui replace `1' = 42 if `2' >= 5995 & `2' <= 5995
	qui replace `1' = 42 if `2' >= 5999 & `2' <= 5999
	
	qui replace `1' = 43 if `2' >= 5800 & `2' <= 5819
	qui replace `1' = 43 if `2' >= 5820 & `2' <= 5829
	qui replace `1' = 43 if `2' >= 5890 & `2' <= 5899
	qui replace `1' = 43 if `2' >= 7000 & `2' <= 7000
	qui replace `1' = 43 if `2' >= 7010 & `2' <= 7019
	qui replace `1' = 43 if `2' >= 7040 & `2' <= 7049
	qui replace `1' = 43 if `2' >= 7213 & `2' <= 7213
	
	qui replace `1' = 44 if `2' >= 6000 & `2' <= 6000
	qui replace `1' = 44 if `2' >= 6010 & `2' <= 6019
	qui replace `1' = 44 if `2' >= 6020 & `2' <= 6020
	qui replace `1' = 44 if `2' >= 6021 & `2' <= 6021
	qui replace `1' = 44 if `2' >= 6022 & `2' <= 6022
	qui replace `1' = 44 if `2' >= 6023 & `2' <= 6024
	qui replace `1' = 44 if `2' >= 6025 & `2' <= 6025
	qui replace `1' = 44 if `2' >= 6026 & `2' <= 6026
	qui replace `1' = 44 if `2' >= 6027 & `2' <= 6027
	qui replace `1' = 44 if `2' >= 6028 & `2' <= 6029
	qui replace `1' = 44 if `2' >= 6030 & `2' <= 6036
	qui replace `1' = 44 if `2' >= 6040 & `2' <= 6059
	qui replace `1' = 44 if `2' >= 6060 & `2' <= 6062
	qui replace `1' = 44 if `2' >= 6080 & `2' <= 6082
	qui replace `1' = 44 if `2' >= 6090 & `2' <= 6099
	qui replace `1' = 44 if `2' >= 6100 & `2' <= 6100
	qui replace `1' = 44 if `2' >= 6110 & `2' <= 6111
	qui replace `1' = 44 if `2' >= 6112 & `2' <= 6113
	qui replace `1' = 44 if `2' >= 6120 & `2' <= 6129
	qui replace `1' = 44 if `2' >= 6130 & `2' <= 6139
	qui replace `1' = 44 if `2' >= 6140 & `2' <= 6149
	qui replace `1' = 44 if `2' >= 6150 & `2' <= 6159
	qui replace `1' = 44 if `2' >= 6160 & `2' <= 6169
	qui replace `1' = 44 if `2' >= 6170 & `2' <= 6179
	qui replace `1' = 44 if `2' >= 6190 & `2' <= 6199
	
	qui replace `1' = 45 if `2' >= 6300 & `2' <= 6300
	qui replace `1' = 45 if `2' >= 6310 & `2' <= 6319
	qui replace `1' = 45 if `2' >= 6320 & `2' <= 6329
	qui replace `1' = 45 if `2' >= 6330 & `2' <= 6331
	qui replace `1' = 45 if `2' >= 6350 & `2' <= 6351
	qui replace `1' = 45 if `2' >= 6360 & `2' <= 6361
	qui replace `1' = 45 if `2' >= 6370 & `2' <= 6379
	qui replace `1' = 45 if `2' >= 6390 & `2' <= 6399
	qui replace `1' = 45 if `2' >= 6400 & `2' <= 6411
	
	qui replace `1' = 46 if `2' >= 6500 & `2' <= 6500
	qui replace `1' = 46 if `2' >= 6510 & `2' <= 6510
	qui replace `1' = 46 if `2' >= 6512 & `2' <= 6512
	qui replace `1' = 46 if `2' >= 6513 & `2' <= 6513
	qui replace `1' = 46 if `2' >= 6514 & `2' <= 6514
	qui replace `1' = 46 if `2' >= 6515 & `2' <= 6515
	qui replace `1' = 46 if `2' >= 6517 & `2' <= 6519
	qui replace `1' = 46 if `2' >= 6520 & `2' <= 6529
	qui replace `1' = 46 if `2' >= 6530 & `2' <= 6531
	qui replace `1' = 46 if `2' >= 6532 & `2' <= 6532
	qui replace `1' = 46 if `2' >= 6540 & `2' <= 6541
	qui replace `1' = 46 if `2' >= 6550 & `2' <= 6553
	qui replace `1' = 46 if `2' >= 6590 & `2' <= 6599
	qui replace `1' = 46 if `2' >= 6610 & `2' <= 6611
	
	qui replace `1' = 47 if `2' >= 6200 & `2' <= 6299
	qui replace `1' = 47 if `2' >= 6700 & `2' <= 6700
	qui replace `1' = 47 if `2' >= 6710 & `2' <= 6719
	qui replace `1' = 47 if `2' >= 6720 & `2' <= 6722
	qui replace `1' = 47 if `2' >= 6723 & `2' <= 6723
	qui replace `1' = 47 if `2' >= 6724 & `2' <= 6724
	qui replace `1' = 47 if `2' >= 6725 & `2' <= 6725
	qui replace `1' = 47 if `2' >= 6726 & `2' <= 6726
	qui replace `1' = 47 if `2' >= 6730 & `2' <= 6733
	qui replace `1' = 47 if `2' >= 6740 & `2' <= 6779
	qui replace `1' = 47 if `2' >= 6790 & `2' <= 6791
	qui replace `1' = 47 if `2' >= 6792 & `2' <= 6792
	qui replace `1' = 47 if `2' >= 6793 & `2' <= 6793
	qui replace `1' = 47 if `2' >= 6794 & `2' <= 6794
	qui replace `1' = 47 if `2' >= 6795 & `2' <= 6795
	qui replace `1' = 47 if `2' >= 6798 & `2' <= 6798
	qui replace `1' = 47 if `2' >= 6799 & `2' <= 6799
	
	qui replace `1' = 48 if `2' >= 4950 & `2' <= 4959
	qui replace `1' = 48 if `2' >= 4960 & `2' <= 4961
	qui replace `1' = 48 if `2' >= 4970 & `2' <= 4971
	qui replace `1' = 48 if `2' >= 4990 & `2' <= 4991
end

program famafrench49
	qui replace `1' = 1 if `2' >= 0100 & `2' <= 0199
	qui replace `1' = 1 if `2' >= 0200 & `2' <= 0299
	qui replace `1' = 1 if `2' >= 0700 & `2' <= 0799
	qui replace `1' = 1 if `2' >= 0910 & `2' <= 0919
	qui replace `1' = 1 if `2' >= 2048 & `2' <= 2048
	
	qui replace `1' = 2 if `2' >= 2000 & `2' <= 2009
	qui replace `1' = 2 if `2' >= 2010 & `2' <= 2019
	qui replace `1' = 2 if `2' >= 2020 & `2' <= 2029
	qui replace `1' = 2 if `2' >= 2030 & `2' <= 2039
	qui replace `1' = 2 if `2' >= 2040 & `2' <= 2046
	qui replace `1' = 2 if `2' >= 2050 & `2' <= 2059
	qui replace `1' = 2 if `2' >= 2060 & `2' <= 2063
	qui replace `1' = 2 if `2' >= 2070 & `2' <= 2079
	qui replace `1' = 2 if `2' >= 2090 & `2' <= 2092
	qui replace `1' = 2 if `2' >= 2095 & `2' <= 2095
	qui replace `1' = 2 if `2' >= 2098 & `2' <= 2099
	
	qui replace `1' = 3 if `2' >= 2064 & `2' <= 2068
	qui replace `1' = 3 if `2' >= 2086 & `2' <= 2086
	qui replace `1' = 3 if `2' >= 2087 & `2' <= 2087
	qui replace `1' = 3 if `2' >= 2096 & `2' <= 2096
	qui replace `1' = 3 if `2' >= 2097 & `2' <= 2097
	
	qui replace `1' = 4 if `2' >= 2080 & `2' <= 2080
	qui replace `1' = 4 if `2' >= 2082 & `2' <= 2082
	qui replace `1' = 4 if `2' >= 2083 & `2' <= 2083
	qui replace `1' = 4 if `2' >= 2084 & `2' <= 2084
	qui replace `1' = 4 if `2' >= 2085 & `2' <= 2085
	
	qui replace `1' = 5 if `2' >= 2100 & `2' <= 2199
	
	qui replace `1' = 6 if `2' >= 0920 & `2' <= 0999
	qui replace `1' = 6 if `2' >= 3650 & `2' <= 3651
	qui replace `1' = 6 if `2' >= 3652 & `2' <= 3652
	qui replace `1' = 6 if `2' >= 3732 & `2' <= 3732
	qui replace `1' = 6 if `2' >= 3930 & `2' <= 3931
	qui replace `1' = 6 if `2' >= 3940 & `2' <= 3949
	
	qui replace `1' = 7 if `2' >= 7800 & `2' <= 7829
	qui replace `1' = 7 if `2' >= 7830 & `2' <= 7833
	qui replace `1' = 7 if `2' >= 7840 & `2' <= 7841
	qui replace `1' = 7 if `2' >= 7900 & `2' <= 7900
	qui replace `1' = 7 if `2' >= 7910 & `2' <= 7911
	qui replace `1' = 7 if `2' >= 7920 & `2' <= 7929
	qui replace `1' = 7 if `2' >= 7930 & `2' <= 7933
	qui replace `1' = 7 if `2' >= 7940 & `2' <= 7949
	qui replace `1' = 7 if `2' >= 7980 & `2' <= 7980
	qui replace `1' = 7 if `2' >= 7990 & `2' <= 7999
	
	qui replace `1' = 8 if `2' >= 2700 & `2' <= 2709
	qui replace `1' = 8 if `2' >= 2710 & `2' <= 2719
	qui replace `1' = 8 if `2' >= 2720 & `2' <= 2729
	qui replace `1' = 8 if `2' >= 2730 & `2' <= 2739
	qui replace `1' = 8 if `2' >= 2740 & `2' <= 2749
	qui replace `1' = 8 if `2' >= 2770 & `2' <= 2771
	qui replace `1' = 8 if `2' >= 2780 & `2' <= 2789
	qui replace `1' = 8 if `2' >= 2790 & `2' <= 2799
	
	qui replace `1' = 9 if `2' >= 2047 & `2' <= 2047
	qui replace `1' = 9 if `2' >= 2391 & `2' <= 2392
	qui replace `1' = 9 if `2' >= 2510 & `2' <= 2519
	qui replace `1' = 9 if `2' >= 2590 & `2' <= 2599
	qui replace `1' = 9 if `2' >= 2840 & `2' <= 2843
	qui replace `1' = 9 if `2' >= 2844 & `2' <= 2844
	qui replace `1' = 9 if `2' >= 3160 & `2' <= 3161
	qui replace `1' = 9 if `2' >= 3170 & `2' <= 3171
	qui replace `1' = 9 if `2' >= 3172 & `2' <= 3172
	qui replace `1' = 9 if `2' >= 3190 & `2' <= 3199
	qui replace `1' = 9 if `2' >= 3229 & `2' <= 3229
	qui replace `1' = 9 if `2' >= 3260 & `2' <= 3260
	qui replace `1' = 9 if `2' >= 3262 & `2' <= 3263
	qui replace `1' = 9 if `2' >= 3269 & `2' <= 3269
	qui replace `1' = 9 if `2' >= 3230 & `2' <= 3231
	qui replace `1' = 9 if `2' >= 3630 & `2' <= 3639
	qui replace `1' = 9 if `2' >= 3750 & `2' <= 3751
	qui replace `1' = 9 if `2' >= 3800 & `2' <= 3800
	qui replace `1' = 9 if `2' >= 3860 & `2' <= 3861
	qui replace `1' = 9 if `2' >= 3870 & `2' <= 3873
	qui replace `1' = 9 if `2' >= 3910 & `2' <= 3911
	qui replace `1' = 9 if `2' >= 3914 & `2' <= 3914
	qui replace `1' = 9 if `2' >= 3915 & `2' <= 3915
	qui replace `1' = 9 if `2' >= 3960 & `2' <= 3962
	qui replace `1' = 9 if `2' >= 3991 & `2' <= 3991
	qui replace `1' = 9 if `2' >= 3995 & `2' <= 3995
	
	qui replace `1' = 10 if `2' >= 2300 & `2' <= 2390
	qui replace `1' = 10 if `2' >= 3020 & `2' <= 3021
	qui replace `1' = 10 if `2' >= 3100 & `2' <= 3111
	qui replace `1' = 10 if `2' >= 3130 & `2' <= 3131
	qui replace `1' = 10 if `2' >= 3140 & `2' <= 3149
	qui replace `1' = 10 if `2' >= 3150 & `2' <= 3151
	qui replace `1' = 10 if `2' >= 3963 & `2' <= 3965
	
	qui replace `1' = 11 if `2' >= 8000 & `2' <= 8099
	
	qui replace `1' = 12 if `2' >= 3693 & `2' <= 3693
	qui replace `1' = 12 if `2' >= 3840 & `2' <= 3849
	qui replace `1' = 12 if `2' >= 3850 & `2' <= 3851
	
	qui replace `1' = 13 if `2' >= 2830 & `2' <= 2830
	qui replace `1' = 13 if `2' >= 2831 & `2' <= 2831
	qui replace `1' = 13 if `2' >= 2833 & `2' <= 2833
	qui replace `1' = 13 if `2' >= 2834 & `2' <= 2834
	qui replace `1' = 13 if `2' >= 2835 & `2' <= 2835
	qui replace `1' = 13 if `2' >= 2836 & `2' <= 2836
	
	qui replace `1' = 14 if `2' >= 2800 & `2' <= 2809
	qui replace `1' = 14 if `2' >= 2810 & `2' <= 2819
	qui replace `1' = 14 if `2' >= 2820 & `2' <= 2829
	qui replace `1' = 14 if `2' >= 2850 & `2' <= 2859
	qui replace `1' = 14 if `2' >= 2860 & `2' <= 2869
	qui replace `1' = 14 if `2' >= 2870 & `2' <= 2879
	qui replace `1' = 14 if `2' >= 2890 & `2' <= 2899
	
	qui replace `1' = 15 if `2' >= 3031 & `2' <= 3031
	qui replace `1' = 15 if `2' >= 3041 & `2' <= 3041
	qui replace `1' = 15 if `2' >= 3050 & `2' <= 3053
	qui replace `1' = 15 if `2' >= 3060 & `2' <= 3069
	qui replace `1' = 15 if `2' >= 3070 & `2' <= 3079
	qui replace `1' = 15 if `2' >= 3080 & `2' <= 3089
	qui replace `1' = 15 if `2' >= 3090 & `2' <= 3099
	
	qui replace `1' = 16 if `2' >= 2200 & `2' <= 2269
	qui replace `1' = 16 if `2' >= 2270 & `2' <= 2279
	qui replace `1' = 16 if `2' >= 2280 & `2' <= 2284
	qui replace `1' = 16 if `2' >= 2290 & `2' <= 2295
	qui replace `1' = 16 if `2' >= 2297 & `2' <= 2297
	qui replace `1' = 16 if `2' >= 2298 & `2' <= 2298
	qui replace `1' = 16 if `2' >= 2299 & `2' <= 2299
	qui replace `1' = 16 if `2' >= 2393 & `2' <= 2395
	qui replace `1' = 16 if `2' >= 2397 & `2' <= 2399
	
	qui replace `1' = 17 if `2' >= 0800 & `2' <= 0899
	qui replace `1' = 17 if `2' >= 2400 & `2' <= 2439
	qui replace `1' = 17 if `2' >= 2450 & `2' <= 2459
	qui replace `1' = 17 if `2' >= 2490 & `2' <= 2499
	qui replace `1' = 17 if `2' >= 2660 & `2' <= 2661
	qui replace `1' = 17 if `2' >= 2950 & `2' <= 2952
	qui replace `1' = 17 if `2' >= 3200 & `2' <= 3200
	qui replace `1' = 17 if `2' >= 3210 & `2' <= 3211
	qui replace `1' = 17 if `2' >= 3240 & `2' <= 3241
	qui replace `1' = 17 if `2' >= 3250 & `2' <= 3259
	qui replace `1' = 17 if `2' >= 3261 & `2' <= 3261
	qui replace `1' = 17 if `2' >= 3264 & `2' <= 3264
	qui replace `1' = 17 if `2' >= 3270 & `2' <= 3275
	qui replace `1' = 17 if `2' >= 3280 & `2' <= 3281
	qui replace `1' = 17 if `2' >= 3290 & `2' <= 3293
	qui replace `1' = 17 if `2' >= 3295 & `2' <= 3299
	qui replace `1' = 17 if `2' >= 3420 & `2' <= 3429
	qui replace `1' = 17 if `2' >= 3430 & `2' <= 3433
	qui replace `1' = 17 if `2' >= 3440 & `2' <= 3441
	qui replace `1' = 17 if `2' >= 3442 & `2' <= 3442
	qui replace `1' = 17 if `2' >= 3446 & `2' <= 3446
	qui replace `1' = 17 if `2' >= 3448 & `2' <= 3448
	qui replace `1' = 17 if `2' >= 3449 & `2' <= 3449
	qui replace `1' = 17 if `2' >= 3450 & `2' <= 3451
	qui replace `1' = 17 if `2' >= 3452 & `2' <= 3452
	qui replace `1' = 17 if `2' >= 3490 & `2' <= 3499
	qui replace `1' = 17 if `2' >= 3996 & `2' <= 3996
	
	qui replace `1' = 18 if `2' >= 1500 & `2' <= 1511
	qui replace `1' = 18 if `2' >= 1520 & `2' <= 1529
	qui replace `1' = 18 if `2' >= 1530 & `2' <= 1539
	qui replace `1' = 18 if `2' >= 1540 & `2' <= 1549
	qui replace `1' = 18 if `2' >= 1600 & `2' <= 1699
	qui replace `1' = 18 if `2' >= 1700 & `2' <= 1799
	
	qui replace `1' = 19 if `2' >= 3300 & `2' <= 3300
	qui replace `1' = 19 if `2' >= 3310 & `2' <= 3317
	qui replace `1' = 19 if `2' >= 3320 & `2' <= 3325
	qui replace `1' = 19 if `2' >= 3330 & `2' <= 3339
	qui replace `1' = 19 if `2' >= 3340 & `2' <= 3341
	qui replace `1' = 19 if `2' >= 3350 & `2' <= 3357
	qui replace `1' = 19 if `2' >= 3360 & `2' <= 3369
	qui replace `1' = 19 if `2' >= 3370 & `2' <= 3379
	qui replace `1' = 19 if `2' >= 3390 & `2' <= 3399
	
	qui replace `1' = 20 if `2' >= 3400 & `2' <= 3400
	qui replace `1' = 20 if `2' >= 3443 & `2' <= 3443
	qui replace `1' = 20 if `2' >= 3444 & `2' <= 3444
	qui replace `1' = 20 if `2' >= 3460 & `2' <= 3469
	qui replace `1' = 20 if `2' >= 3470 & `2' <= 3479
	
	qui replace `1' = 21 if `2' >= 3510 & `2' <= 3519
	qui replace `1' = 21 if `2' >= 3520 & `2' <= 3529
	qui replace `1' = 21 if `2' >= 3530 & `2' <= 3530
	qui replace `1' = 21 if `2' >= 3531 & `2' <= 3531
	qui replace `1' = 21 if `2' >= 3532 & `2' <= 3532
	qui replace `1' = 21 if `2' >= 3533 & `2' <= 3533
	qui replace `1' = 21 if `2' >= 3534 & `2' <= 3534
	qui replace `1' = 21 if `2' >= 3535 & `2' <= 3535
	qui replace `1' = 21 if `2' >= 3536 & `2' <= 3536
	qui replace `1' = 21 if `2' >= 3538 & `2' <= 3538
	qui replace `1' = 21 if `2' >= 3540 & `2' <= 3549
	qui replace `1' = 21 if `2' >= 3550 & `2' <= 3559
	qui replace `1' = 21 if `2' >= 3560 & `2' <= 3569
	qui replace `1' = 21 if `2' >= 3580 & `2' <= 3580
	qui replace `1' = 21 if `2' >= 3581 & `2' <= 3581
	qui replace `1' = 21 if `2' >= 3582 & `2' <= 3582
	qui replace `1' = 21 if `2' >= 3585 & `2' <= 3585
	qui replace `1' = 21 if `2' >= 3586 & `2' <= 3586
	qui replace `1' = 21 if `2' >= 3589 & `2' <= 3589
	qui replace `1' = 21 if `2' >= 3590 & `2' <= 3599
	
	qui replace `1' = 22 if `2' >= 3600 & `2' <= 3600
	qui replace `1' = 22 if `2' >= 3610 & `2' <= 3613
	qui replace `1' = 22 if `2' >= 3620 & `2' <= 3621
	qui replace `1' = 22 if `2' >= 3623 & `2' <= 3629
	qui replace `1' = 22 if `2' >= 3640 & `2' <= 3644
	qui replace `1' = 22 if `2' >= 3645 & `2' <= 3645
	qui replace `1' = 22 if `2' >= 3646 & `2' <= 3646
	qui replace `1' = 22 if `2' >= 3648 & `2' <= 3649
	qui replace `1' = 22 if `2' >= 3660 & `2' <= 3660
	qui replace `1' = 22 if `2' >= 3690 & `2' <= 3690
	qui replace `1' = 22 if `2' >= 3691 & `2' <= 3692
	qui replace `1' = 22 if `2' >= 3699 & `2' <= 3699
	
	qui replace `1' = 23 if `2' >= 2296 & `2' <= 2296
	qui replace `1' = 23 if `2' >= 2396 & `2' <= 2396
	qui replace `1' = 23 if `2' >= 3010 & `2' <= 3011
	qui replace `1' = 23 if `2' >= 3537 & `2' <= 3537
	qui replace `1' = 23 if `2' >= 3647 & `2' <= 3647
	qui replace `1' = 23 if `2' >= 3694 & `2' <= 3694
	qui replace `1' = 23 if `2' >= 3700 & `2' <= 3700
	qui replace `1' = 23 if `2' >= 3710 & `2' <= 3710
	qui replace `1' = 23 if `2' >= 3711 & `2' <= 3711
	qui replace `1' = 23 if `2' >= 3713 & `2' <= 3713
	qui replace `1' = 23 if `2' >= 3714 & `2' <= 3714
	qui replace `1' = 23 if `2' >= 3715 & `2' <= 3715
	qui replace `1' = 23 if `2' >= 3716 & `2' <= 3716
	qui replace `1' = 23 if `2' >= 3792 & `2' <= 3792
	qui replace `1' = 23 if `2' >= 3790 & `2' <= 3791
	qui replace `1' = 23 if `2' >= 3799 & `2' <= 3799
	
	qui replace `1' = 24 if `2' >= 3720 & `2' <= 3720
	qui replace `1' = 24 if `2' >= 3721 & `2' <= 3721
	qui replace `1' = 24 if `2' >= 3723 & `2' <= 3724
	qui replace `1' = 24 if `2' >= 3725 & `2' <= 3725
	qui replace `1' = 24 if `2' >= 3728 & `2' <= 3729
	
	qui replace `1' = 25 if `2' >= 3730 & `2' <= 3731
	qui replace `1' = 25 if `2' >= 3740 & `2' <= 3743
	
	qui replace `1' = 26 if `2' >= 3760 & `2' <= 3769
	qui replace `1' = 26 if `2' >= 3795 & `2' <= 3795
	qui replace `1' = 26 if `2' >= 3480 & `2' <= 3489
	
	qui replace `1' = 27 if `2' >= 1040 & `2' <= 1049
	
	qui replace `1' = 28 if `2' >= 1000 & `2' <= 1009
	qui replace `1' = 28 if `2' >= 1010 & `2' <= 1019
	qui replace `1' = 28 if `2' >= 1020 & `2' <= 1029
	qui replace `1' = 28 if `2' >= 1030 & `2' <= 1039
	qui replace `1' = 28 if `2' >= 1050 & `2' <= 1059
	qui replace `1' = 28 if `2' >= 1060 & `2' <= 1069
	qui replace `1' = 28 if `2' >= 1070 & `2' <= 1079
	qui replace `1' = 28 if `2' >= 1080 & `2' <= 1089
	qui replace `1' = 28 if `2' >= 1090 & `2' <= 1099
	qui replace `1' = 28 if `2' >= 1100 & `2' <= 1119
	qui replace `1' = 28 if `2' >= 1400 & `2' <= 1499
	
	qui replace `1' = 29 if `2' >= 1200 & `2' <= 1299
	
	qui replace `1' = 30 if `2' >= 1300 & `2' <= 1300
	qui replace `1' = 30 if `2' >= 1310 & `2' <= 1319
	qui replace `1' = 30 if `2' >= 1320 & `2' <= 1329
	qui replace `1' = 30 if `2' >= 1330 & `2' <= 1339
	qui replace `1' = 30 if `2' >= 1370 & `2' <= 1379
	qui replace `1' = 30 if `2' >= 1380 & `2' <= 1380
	qui replace `1' = 30 if `2' >= 1381 & `2' <= 1381
	qui replace `1' = 30 if `2' >= 1382 & `2' <= 1382
	qui replace `1' = 30 if `2' >= 1389 & `2' <= 1389
	qui replace `1' = 30 if `2' >= 2900 & `2' <= 2912
	qui replace `1' = 30 if `2' >= 2990 & `2' <= 2999
	
	qui replace `1' = 31 if `2' >= 4900 & `2' <= 4900
	qui replace `1' = 31 if `2' >= 4910 & `2' <= 4911
	qui replace `1' = 31 if `2' >= 4920 & `2' <= 4922
	qui replace `1' = 31 if `2' >= 4923 & `2' <= 4923
	qui replace `1' = 31 if `2' >= 4924 & `2' <= 4925
	qui replace `1' = 31 if `2' >= 4930 & `2' <= 4931
	qui replace `1' = 31 if `2' >= 4932 & `2' <= 4932
	qui replace `1' = 31 if `2' >= 4939 & `2' <= 4939
	qui replace `1' = 31 if `2' >= 4940 & `2' <= 4942
	
	qui replace `1' = 32 if `2' >= 4800 & `2' <= 4800
	qui replace `1' = 32 if `2' >= 4810 & `2' <= 4813
	qui replace `1' = 32 if `2' >= 4820 & `2' <= 4822
	qui replace `1' = 32 if `2' >= 4830 & `2' <= 4839
	qui replace `1' = 32 if `2' >= 4840 & `2' <= 4841
	qui replace `1' = 32 if `2' >= 4880 & `2' <= 4889
	qui replace `1' = 32 if `2' >= 4890 & `2' <= 4890
	qui replace `1' = 32 if `2' >= 4891 & `2' <= 4891
	qui replace `1' = 32 if `2' >= 4892 & `2' <= 4892
	qui replace `1' = 32 if `2' >= 4899 & `2' <= 4899
	
	qui replace `1' = 33 if `2' >= 7020 & `2' <= 7021
	qui replace `1' = 33 if `2' >= 7030 & `2' <= 7033
	qui replace `1' = 33 if `2' >= 7200 & `2' <= 7200
	qui replace `1' = 33 if `2' >= 7210 & `2' <= 7212
	qui replace `1' = 33 if `2' >= 7214 & `2' <= 7214
	qui replace `1' = 33 if `2' >= 7215 & `2' <= 7216
	qui replace `1' = 33 if `2' >= 7217 & `2' <= 7217
	qui replace `1' = 33 if `2' >= 7219 & `2' <= 7219
	qui replace `1' = 33 if `2' >= 7220 & `2' <= 7221
	qui replace `1' = 33 if `2' >= 7230 & `2' <= 7231
	qui replace `1' = 33 if `2' >= 7240 & `2' <= 7241
	qui replace `1' = 33 if `2' >= 7250 & `2' <= 7251
	qui replace `1' = 33 if `2' >= 7260 & `2' <= 7269
	qui replace `1' = 33 if `2' >= 7270 & `2' <= 7290
	qui replace `1' = 33 if `2' >= 7291 & `2' <= 7291
	qui replace `1' = 33 if `2' >= 7292 & `2' <= 7299
	qui replace `1' = 33 if `2' >= 7395 & `2' <= 7395
	qui replace `1' = 33 if `2' >= 7500 & `2' <= 7500
	qui replace `1' = 33 if `2' >= 7520 & `2' <= 7529
	qui replace `1' = 33 if `2' >= 7530 & `2' <= 7539
	qui replace `1' = 33 if `2' >= 7540 & `2' <= 7549
	qui replace `1' = 33 if `2' >= 7600 & `2' <= 7600
	qui replace `1' = 33 if `2' >= 7620 & `2' <= 7620
	qui replace `1' = 33 if `2' >= 7622 & `2' <= 7622
	qui replace `1' = 33 if `2' >= 7623 & `2' <= 7623
	qui replace `1' = 33 if `2' >= 7629 & `2' <= 7629
	qui replace `1' = 33 if `2' >= 7630 & `2' <= 7631
	qui replace `1' = 33 if `2' >= 7640 & `2' <= 7641
	qui replace `1' = 33 if `2' >= 7690 & `2' <= 7699
	qui replace `1' = 33 if `2' >= 8100 & `2' <= 8199
	qui replace `1' = 33 if `2' >= 8200 & `2' <= 8299
	qui replace `1' = 33 if `2' >= 8300 & `2' <= 8399
	qui replace `1' = 33 if `2' >= 8400 & `2' <= 8499
	qui replace `1' = 33 if `2' >= 8600 & `2' <= 8699
	qui replace `1' = 33 if `2' >= 8800 & `2' <= 8899
	qui replace `1' = 33 if `2' >= 7510 & `2' <= 7515
	
	qui replace `1' = 34 if `2' >= 2750 & `2' <= 2759
	qui replace `1' = 34 if `2' >= 3993 & `2' <= 3993
	qui replace `1' = 34 if `2' >= 7218 & `2' <= 7218
	qui replace `1' = 34 if `2' >= 7300 & `2' <= 7300
	qui replace `1' = 34 if `2' >= 7310 & `2' <= 7319
	qui replace `1' = 34 if `2' >= 7320 & `2' <= 7329
	qui replace `1' = 34 if `2' >= 7330 & `2' <= 7339
	qui replace `1' = 34 if `2' >= 7340 & `2' <= 7342
	qui replace `1' = 34 if `2' >= 7349 & `2' <= 7349
	qui replace `1' = 34 if `2' >= 7350 & `2' <= 7351
	qui replace `1' = 34 if `2' >= 7352 & `2' <= 7352
	qui replace `1' = 34 if `2' >= 7353 & `2' <= 7353
	qui replace `1' = 34 if `2' >= 7359 & `2' <= 7359
	qui replace `1' = 34 if `2' >= 7360 & `2' <= 7369
	qui replace `1' = 34 if `2' >= 7374 & `2' <= 7374
	qui replace `1' = 34 if `2' >= 7376 & `2' <= 7376
	qui replace `1' = 34 if `2' >= 7377 & `2' <= 7377
	qui replace `1' = 34 if `2' >= 7378 & `2' <= 7378
	qui replace `1' = 34 if `2' >= 7379 & `2' <= 7379
	qui replace `1' = 34 if `2' >= 7380 & `2' <= 7380
	qui replace `1' = 34 if `2' >= 7381 & `2' <= 7382
	qui replace `1' = 34 if `2' >= 7383 & `2' <= 7383
	qui replace `1' = 34 if `2' >= 7384 & `2' <= 7384
	qui replace `1' = 34 if `2' >= 7385 & `2' <= 7385
	qui replace `1' = 34 if `2' >= 7389 & `2' <= 7390
	qui replace `1' = 34 if `2' >= 7391 & `2' <= 7391
	qui replace `1' = 34 if `2' >= 7392 & `2' <= 7392
	qui replace `1' = 34 if `2' >= 7393 & `2' <= 7393
	qui replace `1' = 34 if `2' >= 7394 & `2' <= 7394
	qui replace `1' = 34 if `2' >= 7396 & `2' <= 7396
	qui replace `1' = 34 if `2' >= 7397 & `2' <= 7397
	qui replace `1' = 34 if `2' >= 7399 & `2' <= 7399
	qui replace `1' = 34 if `2' >= 7519 & `2' <= 7519
	qui replace `1' = 34 if `2' >= 8700 & `2' <= 8700
	qui replace `1' = 34 if `2' >= 8710 & `2' <= 8713
	qui replace `1' = 34 if `2' >= 8720 & `2' <= 8721
	qui replace `1' = 34 if `2' >= 8730 & `2' <= 8734
	qui replace `1' = 34 if `2' >= 8740 & `2' <= 8748
	qui replace `1' = 34 if `2' >= 8900 & `2' <= 8910
	qui replace `1' = 34 if `2' >= 8911 & `2' <= 8911
	qui replace `1' = 34 if `2' >= 8920 & `2' <= 8999
	qui replace `1' = 34 if `2' >= 4220 & `2' <= 4229
	
	qui replace `1' = 35 if `2' >= 3570 & `2' <= 3579
	qui replace `1' = 35 if `2' >= 3680 & `2' <= 3680
	qui replace `1' = 35 if `2' >= 3681 & `2' <= 3681
	qui replace `1' = 35 if `2' >= 3682 & `2' <= 3682
	qui replace `1' = 35 if `2' >= 3683 & `2' <= 3683
	qui replace `1' = 35 if `2' >= 3684 & `2' <= 3684
	qui replace `1' = 35 if `2' >= 3685 & `2' <= 3685
	qui replace `1' = 35 if `2' >= 3686 & `2' <= 3686
	qui replace `1' = 35 if `2' >= 3687 & `2' <= 3687
	qui replace `1' = 35 if `2' >= 3688 & `2' <= 3688
	qui replace `1' = 35 if `2' >= 3689 & `2' <= 3689
	qui replace `1' = 35 if `2' >= 3695 & `2' <= 3695
	
	qui replace `1' = 36 if `2' >= 7370 & `2' <= 7372
	qui replace `1' = 36 if `2' >= 7375 & `2' <= 7375
	qui replace `1' = 36 if `2' >= 7373 & `2' <= 7373
	
	qui replace `1' = 37 if `2' >= 3622 & `2' <= 3622
	qui replace `1' = 37 if `2' >= 3661 & `2' <= 3661
	qui replace `1' = 37 if `2' >= 3662 & `2' <= 3662
	qui replace `1' = 37 if `2' >= 3663 & `2' <= 3663
	qui replace `1' = 37 if `2' >= 3664 & `2' <= 3664
	qui replace `1' = 37 if `2' >= 3665 & `2' <= 3665
	qui replace `1' = 37 if `2' >= 3666 & `2' <= 3666
	qui replace `1' = 37 if `2' >= 3669 & `2' <= 3669
	qui replace `1' = 37 if `2' >= 3670 & `2' <= 3679
	qui replace `1' = 37 if `2' >= 3810 & `2' <= 3810
	qui replace `1' = 37 if `2' >= 3812 & `2' <= 3812
	
	qui replace `1' = 38 if `2' >= 3811 & `2' <= 3811
	qui replace `1' = 38 if `2' >= 3820 & `2' <= 3820
	qui replace `1' = 38 if `2' >= 3821 & `2' <= 3821
	qui replace `1' = 38 if `2' >= 3822 & `2' <= 3822
	qui replace `1' = 38 if `2' >= 3823 & `2' <= 3823
	qui replace `1' = 38 if `2' >= 3824 & `2' <= 3824
	qui replace `1' = 38 if `2' >= 3825 & `2' <= 3825
	qui replace `1' = 38 if `2' >= 3826 & `2' <= 3826
	qui replace `1' = 38 if `2' >= 3827 & `2' <= 3827
	qui replace `1' = 38 if `2' >= 3829 & `2' <= 3829
	qui replace `1' = 38 if `2' >= 3830 & `2' <= 3839
	
	qui replace `1' = 39 if `2' >= 2520 & `2' <= 2549
	qui replace `1' = 39 if `2' >= 2600 & `2' <= 2639
	qui replace `1' = 39 if `2' >= 2670 & `2' <= 2699
	qui replace `1' = 39 if `2' >= 2760 & `2' <= 2761
	qui replace `1' = 39 if `2' >= 3950 & `2' <= 3955
	
	qui replace `1' = 40 if `2' >= 2440 & `2' <= 2449
	qui replace `1' = 40 if `2' >= 2640 & `2' <= 2659
	qui replace `1' = 40 if `2' >= 3220 & `2' <= 3221
	qui replace `1' = 40 if `2' >= 3410 & `2' <= 3412
	
	qui replace `1' = 41 if `2' >= 4000 & `2' <= 4013
	qui replace `1' = 41 if `2' >= 4040 & `2' <= 4049
	qui replace `1' = 41 if `2' >= 4100 & `2' <= 4100
	qui replace `1' = 41 if `2' >= 4110 & `2' <= 4119
	qui replace `1' = 41 if `2' >= 4120 & `2' <= 4121
	qui replace `1' = 41 if `2' >= 4130 & `2' <= 4131
	qui replace `1' = 41 if `2' >= 4140 & `2' <= 4142
	qui replace `1' = 41 if `2' >= 4150 & `2' <= 4151
	qui replace `1' = 41 if `2' >= 4170 & `2' <= 4173
	qui replace `1' = 41 if `2' >= 4190 & `2' <= 4199
	qui replace `1' = 41 if `2' >= 4200 & `2' <= 4200
	qui replace `1' = 41 if `2' >= 4210 & `2' <= 4219
	qui replace `1' = 41 if `2' >= 4230 & `2' <= 4231
	qui replace `1' = 41 if `2' >= 4240 & `2' <= 4249
	qui replace `1' = 41 if `2' >= 4400 & `2' <= 4499
	qui replace `1' = 41 if `2' >= 4500 & `2' <= 4599
	qui replace `1' = 41 if `2' >= 4600 & `2' <= 4699
	qui replace `1' = 41 if `2' >= 4700 & `2' <= 4700
	qui replace `1' = 41 if `2' >= 4710 & `2' <= 4712
	qui replace `1' = 41 if `2' >= 4720 & `2' <= 4729
	qui replace `1' = 41 if `2' >= 4730 & `2' <= 4739
	qui replace `1' = 41 if `2' >= 4740 & `2' <= 4749
	qui replace `1' = 41 if `2' >= 4780 & `2' <= 4780
	qui replace `1' = 41 if `2' >= 4782 & `2' <= 4782
	qui replace `1' = 41 if `2' >= 4783 & `2' <= 4783
	qui replace `1' = 41 if `2' >= 4784 & `2' <= 4784
	qui replace `1' = 41 if `2' >= 4785 & `2' <= 4785
	qui replace `1' = 41 if `2' >= 4789 & `2' <= 4789
	
	qui replace `1' = 42 if `2' >= 5000 & `2' <= 5000
	qui replace `1' = 42 if `2' >= 5010 & `2' <= 5015
	qui replace `1' = 42 if `2' >= 5020 & `2' <= 5023
	qui replace `1' = 42 if `2' >= 5030 & `2' <= 5039
	qui replace `1' = 42 if `2' >= 5040 & `2' <= 5042
	qui replace `1' = 42 if `2' >= 5043 & `2' <= 5043
	qui replace `1' = 42 if `2' >= 5044 & `2' <= 5044
	qui replace `1' = 42 if `2' >= 5045 & `2' <= 5045
	qui replace `1' = 42 if `2' >= 5046 & `2' <= 5046
	qui replace `1' = 42 if `2' >= 5047 & `2' <= 5047
	qui replace `1' = 42 if `2' >= 5048 & `2' <= 5048
	qui replace `1' = 42 if `2' >= 5049 & `2' <= 5049
	qui replace `1' = 42 if `2' >= 5050 & `2' <= 5059
	qui replace `1' = 42 if `2' >= 5060 & `2' <= 5060
	qui replace `1' = 42 if `2' >= 5063 & `2' <= 5063
	qui replace `1' = 42 if `2' >= 5064 & `2' <= 5064
	qui replace `1' = 42 if `2' >= 5065 & `2' <= 5065
	qui replace `1' = 42 if `2' >= 5070 & `2' <= 5078
	qui replace `1' = 42 if `2' >= 5080 & `2' <= 5080
	qui replace `1' = 42 if `2' >= 5081 & `2' <= 5081
	qui replace `1' = 42 if `2' >= 5082 & `2' <= 5082
	qui replace `1' = 42 if `2' >= 5083 & `2' <= 5083
	qui replace `1' = 42 if `2' >= 5084 & `2' <= 5084
	qui replace `1' = 42 if `2' >= 5085 & `2' <= 5085
	qui replace `1' = 42 if `2' >= 5086 & `2' <= 5087
	qui replace `1' = 42 if `2' >= 5088 & `2' <= 5088
	qui replace `1' = 42 if `2' >= 5090 & `2' <= 5090
	qui replace `1' = 42 if `2' >= 5091 & `2' <= 5092
	qui replace `1' = 42 if `2' >= 5093 & `2' <= 5093
	qui replace `1' = 42 if `2' >= 5094 & `2' <= 5094
	qui replace `1' = 42 if `2' >= 5099 & `2' <= 5099
	qui replace `1' = 42 if `2' >= 5100 & `2' <= 5100
	qui replace `1' = 42 if `2' >= 5110 & `2' <= 5113
	qui replace `1' = 42 if `2' >= 5120 & `2' <= 5122
	qui replace `1' = 42 if `2' >= 5130 & `2' <= 5139
	qui replace `1' = 42 if `2' >= 5140 & `2' <= 5149
	qui replace `1' = 42 if `2' >= 5150 & `2' <= 5159
	qui replace `1' = 42 if `2' >= 5160 & `2' <= 5169
	qui replace `1' = 42 if `2' >= 5170 & `2' <= 5172
	qui replace `1' = 42 if `2' >= 5180 & `2' <= 5182
	qui replace `1' = 42 if `2' >= 5190 & `2' <= 5199
	
	qui replace `1' = 43 if `2' >= 5200 & `2' <= 5200
	qui replace `1' = 43 if `2' >= 5210 & `2' <= 5219
	qui replace `1' = 43 if `2' >= 5220 & `2' <= 5229
	qui replace `1' = 43 if `2' >= 5230 & `2' <= 5231
	qui replace `1' = 43 if `2' >= 5250 & `2' <= 5251
	qui replace `1' = 43 if `2' >= 5260 & `2' <= 5261
	qui replace `1' = 43 if `2' >= 5270 & `2' <= 5271
	qui replace `1' = 43 if `2' >= 5300 & `2' <= 5300
	qui replace `1' = 43 if `2' >= 5310 & `2' <= 5311
	qui replace `1' = 43 if `2' >= 5320 & `2' <= 5320
	qui replace `1' = 43 if `2' >= 5330 & `2' <= 5331
	qui replace `1' = 43 if `2' >= 5334 & `2' <= 5334
	qui replace `1' = 43 if `2' >= 5340 & `2' <= 5349
	qui replace `1' = 43 if `2' >= 5390 & `2' <= 5399
	qui replace `1' = 43 if `2' >= 5400 & `2' <= 5400
	qui replace `1' = 43 if `2' >= 5410 & `2' <= 5411
	qui replace `1' = 43 if `2' >= 5412 & `2' <= 5412
	qui replace `1' = 43 if `2' >= 5420 & `2' <= 5429
	qui replace `1' = 43 if `2' >= 5430 & `2' <= 5439
	qui replace `1' = 43 if `2' >= 5440 & `2' <= 5449
	qui replace `1' = 43 if `2' >= 5450 & `2' <= 5459
	qui replace `1' = 43 if `2' >= 5460 & `2' <= 5469
	qui replace `1' = 43 if `2' >= 5490 & `2' <= 5499
	qui replace `1' = 43 if `2' >= 5500 & `2' <= 5500
	qui replace `1' = 43 if `2' >= 5510 & `2' <= 5529
	qui replace `1' = 43 if `2' >= 5530 & `2' <= 5539
	qui replace `1' = 43 if `2' >= 5540 & `2' <= 5549
	qui replace `1' = 43 if `2' >= 5550 & `2' <= 5559
	qui replace `1' = 43 if `2' >= 5560 & `2' <= 5569
	qui replace `1' = 43 if `2' >= 5570 & `2' <= 5579
	qui replace `1' = 43 if `2' >= 5590 & `2' <= 5599
	qui replace `1' = 43 if `2' >= 5600 & `2' <= 5699
	qui replace `1' = 43 if `2' >= 5700 & `2' <= 5700
	qui replace `1' = 43 if `2' >= 5710 & `2' <= 5719
	qui replace `1' = 43 if `2' >= 5720 & `2' <= 5722
	qui replace `1' = 43 if `2' >= 5730 & `2' <= 5733
	qui replace `1' = 43 if `2' >= 5734 & `2' <= 5734
	qui replace `1' = 43 if `2' >= 5735 & `2' <= 5735
	qui replace `1' = 43 if `2' >= 5736 & `2' <= 5736
	qui replace `1' = 43 if `2' >= 5750 & `2' <= 5799
	qui replace `1' = 43 if `2' >= 5900 & `2' <= 5900
	qui replace `1' = 43 if `2' >= 5910 & `2' <= 5912
	qui replace `1' = 43 if `2' >= 5920 & `2' <= 5929
	qui replace `1' = 43 if `2' >= 5930 & `2' <= 5932
	qui replace `1' = 43 if `2' >= 5940 & `2' <= 5940
	qui replace `1' = 43 if `2' >= 5941 & `2' <= 5941
	qui replace `1' = 43 if `2' >= 5942 & `2' <= 5942
	qui replace `1' = 43 if `2' >= 5943 & `2' <= 5943
	qui replace `1' = 43 if `2' >= 5944 & `2' <= 5944
	qui replace `1' = 43 if `2' >= 5945 & `2' <= 5945
	qui replace `1' = 43 if `2' >= 5946 & `2' <= 5946
	qui replace `1' = 43 if `2' >= 5947 & `2' <= 5947
	qui replace `1' = 43 if `2' >= 5948 & `2' <= 5948
	qui replace `1' = 43 if `2' >= 5949 & `2' <= 5949
	qui replace `1' = 43 if `2' >= 5950 & `2' <= 5959
	qui replace `1' = 43 if `2' >= 5960 & `2' <= 5969
	qui replace `1' = 43 if `2' >= 5970 & `2' <= 5979
	qui replace `1' = 43 if `2' >= 5980 & `2' <= 5989
	qui replace `1' = 43 if `2' >= 5990 & `2' <= 5990
	qui replace `1' = 43 if `2' >= 5992 & `2' <= 5992
	qui replace `1' = 43 if `2' >= 5993 & `2' <= 5993
	qui replace `1' = 43 if `2' >= 5994 & `2' <= 5994
	qui replace `1' = 43 if `2' >= 5995 & `2' <= 5995
	qui replace `1' = 43 if `2' >= 5999 & `2' <= 5999
	
	qui replace `1' = 44 if `2' >= 5800 & `2' <= 5819
	qui replace `1' = 44 if `2' >= 5820 & `2' <= 5829
	qui replace `1' = 44 if `2' >= 5890 & `2' <= 5899
	qui replace `1' = 44 if `2' >= 7000 & `2' <= 7000
	qui replace `1' = 44 if `2' >= 7010 & `2' <= 7019
	qui replace `1' = 44 if `2' >= 7040 & `2' <= 7049
	qui replace `1' = 44 if `2' >= 7213 & `2' <= 7213
	
	qui replace `1' = 45 if `2' >= 6000 & `2' <= 6000
	qui replace `1' = 45 if `2' >= 6010 & `2' <= 6019
	qui replace `1' = 45 if `2' >= 6020 & `2' <= 6020
	qui replace `1' = 45 if `2' >= 6021 & `2' <= 6021
	qui replace `1' = 45 if `2' >= 6022 & `2' <= 6022
	qui replace `1' = 45 if `2' >= 6023 & `2' <= 6024
	qui replace `1' = 45 if `2' >= 6025 & `2' <= 6025
	qui replace `1' = 45 if `2' >= 6026 & `2' <= 6026
	qui replace `1' = 45 if `2' >= 6027 & `2' <= 6027
	qui replace `1' = 45 if `2' >= 6028 & `2' <= 6029
	qui replace `1' = 45 if `2' >= 6030 & `2' <= 6036
	qui replace `1' = 45 if `2' >= 6040 & `2' <= 6059
	qui replace `1' = 45 if `2' >= 6060 & `2' <= 6062
	qui replace `1' = 45 if `2' >= 6080 & `2' <= 6082
	qui replace `1' = 45 if `2' >= 6090 & `2' <= 6099
	qui replace `1' = 45 if `2' >= 6100 & `2' <= 6100
	qui replace `1' = 45 if `2' >= 6110 & `2' <= 6111
	qui replace `1' = 45 if `2' >= 6112 & `2' <= 6113
	qui replace `1' = 45 if `2' >= 6120 & `2' <= 6129
	qui replace `1' = 45 if `2' >= 6130 & `2' <= 6139
	qui replace `1' = 45 if `2' >= 6140 & `2' <= 6149
	qui replace `1' = 45 if `2' >= 6150 & `2' <= 6159
	qui replace `1' = 45 if `2' >= 6160 & `2' <= 6169
	qui replace `1' = 45 if `2' >= 6170 & `2' <= 6179
	qui replace `1' = 45 if `2' >= 6190 & `2' <= 6199
	
	qui replace `1' = 46 if `2' >= 6300 & `2' <= 6300
	qui replace `1' = 46 if `2' >= 6310 & `2' <= 6319
	qui replace `1' = 46 if `2' >= 6320 & `2' <= 6329
	qui replace `1' = 46 if `2' >= 6330 & `2' <= 6331
	qui replace `1' = 46 if `2' >= 6350 & `2' <= 6351
	qui replace `1' = 46 if `2' >= 6360 & `2' <= 6361
	qui replace `1' = 46 if `2' >= 6370 & `2' <= 6379
	qui replace `1' = 46 if `2' >= 6390 & `2' <= 6399
	qui replace `1' = 46 if `2' >= 6400 & `2' <= 6411
	
	qui replace `1' = 47 if `2' >= 6500 & `2' <= 6500
	qui replace `1' = 47 if `2' >= 6510 & `2' <= 6510
	qui replace `1' = 47 if `2' >= 6512 & `2' <= 6512
	qui replace `1' = 47 if `2' >= 6513 & `2' <= 6513
	qui replace `1' = 47 if `2' >= 6514 & `2' <= 6514
	qui replace `1' = 47 if `2' >= 6515 & `2' <= 6515
	qui replace `1' = 47 if `2' >= 6517 & `2' <= 6519
	qui replace `1' = 47 if `2' >= 6520 & `2' <= 6529
	qui replace `1' = 47 if `2' >= 6530 & `2' <= 6531
	qui replace `1' = 47 if `2' >= 6532 & `2' <= 6532
	qui replace `1' = 47 if `2' >= 6540 & `2' <= 6541
	qui replace `1' = 47 if `2' >= 6550 & `2' <= 6553
	qui replace `1' = 47 if `2' >= 6590 & `2' <= 6599
	qui replace `1' = 47 if `2' >= 6610 & `2' <= 6611
	
	qui replace `1' = 48 if `2' >= 6200 & `2' <= 6299
	qui replace `1' = 48 if `2' >= 6700 & `2' <= 6700
	qui replace `1' = 48 if `2' >= 6710 & `2' <= 6719
	qui replace `1' = 48 if `2' >= 6720 & `2' <= 6722
	qui replace `1' = 48 if `2' >= 6723 & `2' <= 6723
	qui replace `1' = 48 if `2' >= 6724 & `2' <= 6724
	qui replace `1' = 48 if `2' >= 6725 & `2' <= 6725
	qui replace `1' = 48 if `2' >= 6726 & `2' <= 6726
	qui replace `1' = 48 if `2' >= 6730 & `2' <= 6733
	qui replace `1' = 48 if `2' >= 6740 & `2' <= 6779
	qui replace `1' = 48 if `2' >= 6790 & `2' <= 6791
	qui replace `1' = 48 if `2' >= 6792 & `2' <= 6792
	qui replace `1' = 48 if `2' >= 6793 & `2' <= 6793
	qui replace `1' = 48 if `2' >= 6794 & `2' <= 6794
	qui replace `1' = 48 if `2' >= 6795 & `2' <= 6795
	qui replace `1' = 48 if `2' >= 6798 & `2' <= 6798
	qui replace `1' = 48 if `2' >= 6799 & `2' <= 6799
	
	qui replace `1' = 49 if `2' >= 4950 & `2' <= 4959
	qui replace `1' = 49 if `2' >= 4960 & `2' <= 4961
	qui replace `1' = 49 if `2' >= 4970 & `2' <= 4971
	qui replace `1' = 49 if `2' >= 4990 & `2' <= 4991
end
