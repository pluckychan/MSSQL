/* table and content used in the view =========================================================
MstStudent
StudentID	GivenName	SurName	Birthday				Sex	Addr				Phone		Mobile		EntryDate
0000000001	Chole		Owen	2011-04-13 00:00:00.000	F	8 Demark Road		22333444556	22333444556	2021-09-01 00:00:00.000
0000000002	Xavier		Chu		2011-12-27 00:00:00.000	M	15 Norton Road		22333444888	22333444888	2022-06-20 00:00:00.000
0000000003	Hayden		King	2012-03-13 00:00:00.000	M	38 Binfield Road	22333444589	22333444589	2022-04-05 00:00:00.000
0000000004	Edwin		Ling	2012-05-04 00:00:00.000	M	19 Nathen Road		22333444732	22333444732	2022-06-20 00:00:00.000
0000000005	Joey		Dow		2012-01-19 00:00:00.000	F	19 Maiden Road		22333444797	22333444797	2022-09-20 00:00:00.000

MstSubjectType
SubjectType		TypeName			Factor
ENG				General English		3.0000
GEOGRAPHY		Geography			1.0000
MATHS			General Mathmetics	2.0000
RELIGION		Regilious Study		1.0000
SCIENCE			Science				1.0000

MstSubject
SubjectID		SubjectName			SubjectType	Factor
COMPOSITION		English Composition	ENG			0.4000
GEOGRAPHY		Geography			GEOGRAPHY	1.0000
LISTENING		English Listening	ENG			0.2000
MATHS			General Mathmetics	MATHS		1.0000
READING			English Reading		ENG			0.4000
RELIGIOUS		Regilious Study		RELIGION	1.0000
SCIENCE			Science				SCIENCE		1.0000

MstAcademicResult
StudentID	SubjectID	AcademicYear	Semester	Score	SubjectType
0000000001	READING		2022			A			80.0000	ENG
0000000002	READING		2022			A			88.0000	ENG
0000000003	READING		2022			A			67.0000	ENG
0000000004	READING		2022			A			79.0000	ENG
0000000005	READING		2022			A			53.0000	ENG
0000000001	COMPOSITION	2022			A			98.0000	ENG
0000000002	COMPOSITION	2022			A			90.0000	ENG
0000000003	COMPOSITION	2022			A			70.0000	ENG
0000000004	COMPOSITION	2022			A			75.0000	ENG
0000000005	COMPOSITION	2022			A			78.0000	ENG
0000000001	LISTENING	2022			A			87.0000	ENG
0000000002	LISTENING	2022			A			80.0000	ENG
0000000003	LISTENING	2022			A			83.0000	ENG
0000000004	LISTENING	2022			A			79.0000	ENG
0000000005	LISTENING	2022			A			60.0000	ENG
0000000001	MATHS		2022			A			90.0000	MATHS
0000000002	MATHS		2022			A			95.0000	MATHS
0000000003	MATHS		2022			A			83.0000	MATHS
0000000004	MATHS		2022			A			88.0000	MATHS
0000000005	MATHS		2022			A			82.0000	MATHS
0000000001	RELIGIOUS	2022			A			80.0000	RELIGION
0000000002	RELIGIOUS	2022			A			70.0000	RELIGION
0000000003	RELIGIOUS	2022			A			75.0000	RELIGION
0000000004	RELIGIOUS	2022			A			81.0000	RELIGION
0000000005	RELIGIOUS	2022			A			63.0000	RELIGION
0000000001	COMPOSITION	2022			A			98.0000	ENG
0000000002	COMPOSITION	2022			A			90.0000	ENG
0000000003	COMPOSITION	2022			A			70.0000	ENG
0000000004	COMPOSITION	2022			A			75.0000	ENG
0000000005	COMPOSITION	2022			A			78.0000	ENG
0000000001	SCIENCE		2022			A			85.0000	SCIENCE
0000000002	SCIENCE		2022			A			90.0000	SCIENCE
0000000003	SCIENCE		2022			A			83.0000	SCIENCE
0000000004	SCIENCE		2022			A			88.0000	SCIENCE
0000000005	SCIENCE		2022			A			80.0000	SCIENCE
0000000001	GEOGRAPHY	2022			A			70.0000	GEOGRAPHY
0000000002	GEOGRAPHY	2022			A			75.0000	GEOGRAPHY
0000000003	GEOGRAPHY	2022			A			85.0000	GEOGRAPHY
0000000004	GEOGRAPHY	2022			A			78.0000	GEOGRAPHY
0000000005	GEOGRAPHY	2022			A			68.0000	GEOGRAPHY
*/

/*	============================================================================================
	view to list out the academic result of student with student name and subject information 
	by linking with subject / student master tables 
	============================================================================================*/
CREATE VIEW v_AcademicResultBySubject
AS
select	ar.StudentID, s.GivenName, s.SurName, ar.AcademicYear, ar.Semester, 
		st.TypeName [Main Subject], sub.SubjectName [Subject],
		ar.Score, st.Factor [Main Factor], sub.Factor [Factor]
from mstSubject sub inner join mstSubjectType st on sub.SubjectType = st.SubjectType
	inner join AcademicResult ar ON ar.SubjectID = sub.SubjectID AND ar.SubjectType = sub.SubjectType
	inner join mstStudent s ON ar.StudentID = s.StudentID
	
/*	============================================================================================
	view to list out the academic result of student by MAIN SUBJECT 
	with student name and subject information 
	by linking with subject / student master tables, and calculating the subject score by the multipying subject factor 
	============================================================================================*/	
CREATE VIEW v_AcademicResultByMainSubject
AS
select	ms.StudentID, s.GivenName, s.SurName, ms.AcademicYear, ms.Semester, 
		ms.MainSubject, ms.Score, ms.Factor [Main Factor]
from (
		select	ar.StudentID, st.SubjectType, st.TypeName [MainSubject], st.Factor, 
				ar.AcademicYear, ar.Semester, SUM(ar.Score * sub.Factor) Score
		from mstSubject sub inner join mstSubjectType st on sub.SubjectType = st.SubjectType
			inner join AcademicResult ar ON ar.SubjectID = sub.SubjectID AND ar.SubjectType = sub.SubjectType
			GROUP BY st.SubjectType, st.TypeName, ar.StudentID, st.Factor, ar.AcademicYear, ar.Semester
	) ms
	inner join mstStudent s ON ms.StudentID = s.StudentID

/*	============================================================================================
	view to list out the summarized academic result of student by Acamedic Year
	with student name and subject information 
	by linking with subject / student master tables, and calculating the subject score by the multipying subject factor 
	============================================================================================*/	
CREATE VIEW v_AcademicResult
AS
	select	ms.StudentID, s.GivenName, s.SurName, ms.AcademicYear, ms.Semester, 
			(ms.Score / sf.SumOfFactor) Score
	from (
			select	ar.StudentID,  
					ar.AcademicYear, ar.Semester, 
					SUM(ar.Score * sub.Factor * st.Factor)  Score
			from mstSubject sub inner join mstSubjectType st on sub.SubjectType = st.SubjectType
				inner join AcademicResult ar ON ar.SubjectID = sub.SubjectID AND ar.SubjectType = sub.SubjectType
				GROUP BY ar.StudentID, ar.AcademicYear, ar.Semester
		) ms
		inner join mstStudent s ON ms.StudentID = s.StudentID
		inner join (select sum(Factor) SumOfFactor FROM mstSubjectType) sf ON 1=1