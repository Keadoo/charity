1.Descriptive statistics. *This produces Table 1 and Table 2:
use "C:\Users\可爱多\Desktop\Data and Commands\Processed data\Three years of unbalanced panel data.dta"
sum donation lndonation_size internet hours
sum donation lndonation_size if internet==1
sum donation lndonation_size if internet==0
sum age male hk partner education party fam_size urban lnincome

2.Benchmarking regression. *This produces Table 3:
use "C:\Users\可爱多\Desktop\Data and Commands\Processed data\Three years of unbalanced panel data.dta"
probit donation internet age male hk partner education party fam_size urban lnincome i.year i.provcd,r
margins, dydx(*)post
outreg2 using myfile.doc,replace
probit donation hours hours2 age male hk partner education party fam_size urban lnincome i.year i.provcd,r
margins, dydx(*)post
outreg2 using myfile.doc,replace
reg lndonation_size internet age male hk partner education party fam_size urban lnincome i.year i.provcd,r
outreg2 using myfile.doc,replace
reg lndonation_size hours hours2 age male hk partner education party fam_size urban lnincome i.year i.provcd,r
outreg2 using myfile.doc,replace

3.Regulatory effects. *This produces Table 4 and Table 5：
use "C:\Users\可爱多\Desktop\Data and Commands\Processed data\Three years of unbalanced panel data.dta"
center internet
center hours
center charity
gen internet×charity= c_internet* c_charity
gen hours×charity= c_hours * c_charity
probit donation internet internet×charity age male hk partner education party fam_size urban lnincome i.year i.provcd ,r
margins, dydx(*)post
outreg2 using myfile.doc,replace
probit donation hours hours×charity age male hk partner education party fam_size urban lnincome i.year i.provcd ,r
margins, dydx(*)post
outreg2 using myfile.doc,replace
reg lndonation_size internet internet×charity age male hk partner education party fam_size urban lnincome i.year i.provcd ,r
outreg2 using myfile.doc,replace
reg lndonation_size hours hours×charity age male hk partner education party fam_size urban lnincome i.year i.provcd ,r
outreg2 using myfile.doc,replace

4.Instrumental Variable Method. *This produces Table 6：
use "C:\Users\可爱多\Desktop\Data and Commands\Processed data\2014 Instrumental variables.dta"
ivreg2 donation age male hk partner education party fam_size urban lnincome ( internet= owner_ratio user_ratio) i.provcd14 ,first savefp(first)
eststo second
outreg2 [first second] using myfile.doc, tstat bdec(3) tdec(2) replace
ivreg2 lndonation_size age male hk partner education party fam_size urban lnincome ( internet= owner_ratio user_ratio) i.provcd14 ,first savefp(first)
eststo second
outreg2 [first second] using myfile.doc, tstat bdec(3) tdec(2) replace

5.Heckman model. *This produces Table 7：
use "C:\Users\可爱多\Desktop\Data and Commands\Processed data\Three years of unbalanced panel data.dta"
heckman lndonation_size internet age male hk partner education party fam_size urban lnincome i.year i.provcd , select( donation = internet age male hk partner education party fam_size urban lnincome i.year i.provcd)
esttab using d:/模型1.rtf, se r2 star(* 0.1 ** 0.05 *** 0.01)
heckman lndonation_size hours age male hk partner education party fam_size urban lnincome i.year i.provcd , select( donation = hours age male hk partner education party fam_size urban lnincome i.year i.provcd)
esttab using d:/模型2.rtf, se r2 star(* 0.1 ** 0.05 *** 0.01)

6.Mediation effect. *This produces Table 8：
use "C:\Users\可爱多\Desktop\Data and Commands\Processed data\Three years of unbalanced panel data.dta"
reg Public_Confidence internet age male hk partner education party fam_size urban lnincome i.year i.provcd ,r
outreg2 using myfile.doc,replace
probit donation internet Public_Confidence age male hk partner education party fam_size urban lnincome i.year i.provcd ,r
outreg2 using myfile.doc,replace
reg lndonation_size internet Public_Confidence age male hk partner education party fam_size urban lnincome i.year i.provcd ,r
outreg2 using myfile.doc,replace
reg Public_Confidence hours age male hk partner education party fam_size urban lnincome i.year i.provcd ,r
outreg2 using myfile.doc,replace
probit donation hours Public_Confidence age male hk partner education party fam_size urban lnincome i.year i.provcd ,r
outreg2 using myfile.doc,replace
reg lndonation_size hours Public_Confidence age male  hk partner education party fam_size urban lnincome i.year i.provcd ,r
outreg2 using myfile.doc,replace
