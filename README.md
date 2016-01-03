# PD Clinical Trial
We are using data from both Andriod (Microsoft Band) and iOS (Apple Watch) to help Parkinson's Disease clinical trial data collection.

###Small Data for Clinical Trial Screening
Yanbo Li, Praveen Kumar

###1 Parkinson’s Clinical Trial
Parkinson’s disease (PD) is a neurodegenerative disorder that caused by the deficiency of
basal ganglia, which unbalance dopamine and acetylcholine. As the PD developed, patient
symptom start with a feeling of weakness or stiffness in one limb, and then the tremor spreads
and follow with shuffling gait with poor arm swing. [1]

In this lab, we are using mobile to collect steps and tapping data to help classify patients
for PD clinical trial. Clinical trials for PD use a selfreport questionnaire called Unified
Parkinson’s Disease Rating Scale (UPDRS) as baseline measures. A PD clinical trial done by
University of Rochester, Pioglitazone in Early Parkinson’s Disease , for example, put the sum of
score in UPDRS ADL as a measurement to evaluate patient’s PD condition under certain amount
of Pioglitazone. [2]

There are totally 42 questions in UPDRS that evaluate clinical trial subjects in four
aspect: I Mentation, behavior and mood, II Activities of daily living, III Motor examination, and
IV Complication of therapy. And among these, part II and III are most frequently used in clinical
trials. We chose walking (in section II) and finger types (in section III) as our first and second
data stream respectively.[3]

We chose walking and finger types for three reasons:
a. Daily activity is essential in clinical trials, and UPDRS score could be subjective. Figure
below shows the process of answering a UPDRS question. There isn’t a quantitative
measurement that gives the subject a clear boundary of “normal”, “Slight”, “Mild”,
“Moderate”, or “Severe”, and the problem is that different people may scale the same
situation differently, and research testing may also result in scale changes[4]. That
problem also occurs in clinics “pain scale”. But unlike pain, walking or finger taps can be
easily quantified using wearables or smartphones, which would give the clinical trial
researchers a much more accurate baseline.
b. Steps and tappings can be easily recorded by a subject’s wearable. Other symptoms like
blood pressure or tumor may also be recorded numerically, but would probably require a
bunch of additional equipments to monitor, which makes the clinical trial unnatural and
troublesome. Walking and tapping are something can be done easily with a smartphone
and require the minimum participation from subjects.
c. Based on the existing tools we might leverage (HealthKit/mPower in ResearchKit,
Microsoft Band), steps and tapping are more reliable data streams we can get.

###2 Environment For Data Collection
iOS & Apple Watch / Android & Microsoft Band: data collection
mPower : an open source App with ResearchKit specifically collecting data for Parkinson’s
Disease study
QS Access: an App used for extract data from Healthkit
SQL: offline data charting
Python : data analysis

###3 Data Analyses
We created a micro mini database ( in Microsoft’s SQL Server ) to store, analyse and
build the dashboard. We built the dashboard using Power bi business intelligence tool. We have
attached this dashboard screen capture as separate jpeg file. Date, tapping details, steps, patient
profile would describe the patient activity details. And unavailable days shows the patient
screening. Currently we are displaying data for 2 persons(Sunny and Praveen).
a. Walking
Treadmill training for the treatment of gait disturbances in people with Parkinson’s
disease: a minireview
talks about how parkins patients are treated with treadmill walking ,We
aimed to capture those with our app. Capturing steps is essential to this goal. Our Step table is
derived from this literature .Please refer to steps count and step code description in above
dashboard.Plus Microsoft band’s health dashboard gives a comparative study for various
measures ( like steps, sleeping pattern etc ) against other Microsoft band users We have used that
to validate our steps dimension.
b. Finger Tap
Based on finger tapping movements of PD research, the rate of recorded occlusions of control
group is 16.1%, the rate of early stage PD patients is 5.9%, and 3.8% for severe PD patients. [5]
The tapping test we used on mPower gives us the data of tapping times in 20 seconds. Using the
proportion in the research to fit within the UPDRSscale,
we classify the tappin data into five
groups:
Tapping result UPDRS Scale Description
>100 0 Normal
50100
1 Mild difficulty
2050
2 Moderate difficulty
1020
3 Severely impaired
010
4 Can barely perform the test
As shown in the figure above, the result of tapping test is: both subjects performed
normal . Meaning, according to the tapping test, both subjects have showed a really low
possibility to have PD symptom.
c. SelfReport
We used the questionnaire in mPower for selfreport.
In this questionnaire, we put eight
questions that evaluate the subject’s cognitive, mental, and other conditions that can hardly be
detected with mobile. And clinical trial subjects would be given 5 choices to each questions:
Never, Occasionally, Sometimes, Often, and Always. According to UPDRS scale, we quantified
the answers and calculate the sum of all eight questions:
Never 0
Occasionally 1
Sometimes 2
Often 3
Always 4
So the result for Sunny would be 8, and for
Praveen would be 17, which means that
both subjects are having mild mental
depression based on UPDRS description.

###4 Summary
Walking and finger taps are important baseline measures in Parkinson’s Disease clinical
trials. These measurements are now mainly answered as UPDRS with observations or subjects
selfreport,
which could be subjective and inaccurate. Also, selfreport
should be more easily
accessed to the patients.
In order to improve PD clinical trials, we used wearables to collect walking data, and
mobile for finger taps and selfreport.
According to our research, walking and tapping data can
be easily and accurately collected with wearables and mobile, and then classify the patients
(normal, slight, mild, moderate, severe) according to the UPDRS in runin
as well as screen
(when there is no data point shown in the dashboard). For the PD clinical trial research
mentioned before, Pioglitazone in Early Parkinson’s Disease , for example, would have a more
accurate baseline in UPDRS ADL, and the patients that has less data points would be noticed
during the screening.

###Reference
[1] Parkinson’s Disease Health Center , WebMD,
http://www.webmd.com/parkinsonsdisease/guide/parkinsonstreatmentcare
[2] Pioglitazone in Early Parkinson’s Disease , ClinicalTrials.gov,
https://clinicaltrials.gov/ct2/show/results/NCT01280123?term=parkinson&rank=10&sect=X01256#all
[3] UPDRS Document. http://img.medscape.com/fullsize/701/816/58977_UPDRS.pdf
[4] Ghristopher G. Geotz, … , Movement Disorder SocietySponsored Revision of the Unified
Parkinson’s Disease Rating Scale (MDSUPDRS):
Scale Presentation and Clinimetric Testing
Results , Movement Disorders, Vol. 23, No. 15, 2008, pp. 21292170
[5] C. Lainscsek, P. Rowat, …, Finger tapping movements of Parkinson’s disease patients
automatically rated using nonlinear delay differential equations , Chaos. 2012 Mar; 22(1):
01311901311913

###Related Documents and Code
Selfreport
Doc:
https://docs.google.com/document/d/17v4JUyO-TK1bUFio6Vfw_lYZtjWPXuo3nxFYKgUFvL8/edit?usp=sharing
Code on Github: https://github.com/sunnyliyanbo1357/PD_Clinical_Trial.git
