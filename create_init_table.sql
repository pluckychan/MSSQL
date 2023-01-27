
create table mstStudent (			/* Student Information Master Information */
	StudentID		varchar(10) not null primary key clustered,	/* Unique of Student, insequence of ########## */
	GivenName		nvarchar(200),
	SurName			nvarchar(100),
	Birthday		DateTime,
	Sex				char(1),
	Addr			nvarchar(500),
	Phone			varchar(20),
	Mobile			varchar(20),
	EntryDate		DateTime
)

create table mstSubjectType (		/* Master table of Subject Type */
	SubjectType	varchar(200) not null primary key clustered,
	TypeName	nvarchar(200),
	Factor		decimal(18, 4)		/* proportion of subject type in score */
)

create table mstSubject (
	SubjectID		varchar(100) not null primary key clustered /* unique key of subject*/,
	SubjectName		varchar(300),
	SubjectType		varchar(200),
	constraint fk_sbj_SubjecType foreign key (SubjectType) references mstSubjectType (SubjectType),
	Factor		decimal(18, 4)		/* proportion of subject in score */
)

/*
alter table mstSubject add Factor decimal(18, 4)
alter table mstSubject add constraint fk_sbj_SubjecType foreign key (SubjectType) references mstSubjectType (SubjectType)
*/

/*
alter table mstSubject add constraint fk_sbj_SubjecType foreign key (SubjectType) references mstSubjectType (SubjectType)
*/

create table AcademicResult (
	StudentID		varchar(10) not null,	/* foreign key linked to table mstStudent */
	SubjectType		varchar(200) not null,   /* foreign key linked to table mstSubjectType */
	SubjectID		varchar(100) not null,   /* foreign key linked to table mstSubject */
	AcademicYear	varchar(4),
	Semester		char(1),
	Score			numeric(18, 4),	/* score of the semester */
	constraint fk_ar_StudentID foreign key(StudentID) references mstStudent (StudentID),
	constraint fk_ar_SubjectID foreign key(SubjectID) references mstSubject (SubjectID)
)

insert into mstStudent (StudentID, GivenName, SurName, Birthday, Sex, Addr, Phone, Mobile, EntryDate)
values (format(1, '0000000000'), 'Chole', 'Owen', '2011/04/13', 'F', '8 Demark Road', '22333444556', '22333444556','20210901')

insert into mstStudent (StudentID, GivenName, SurName, Birthday, Sex, Addr, Phone, Mobile, EntryDate)
values (format(2, '0000000000'), 'Xavier', 'Chu', '2011/12/27', 'M', '15 Norton Road', '22333444888', '22333444888', '20220620')

insert into mstStudent (StudentID, GivenName, SurName, Birthday, Sex, Addr, Phone, Mobile, EntryDate)
values (format(3, '0000000000'), 'Hayden', 'King', '2012/03/13', 'M', '38 Binfield Road', '22333444589', '22333444589','20220405')

insert into mstStudent (StudentID, GivenName, SurName, Birthday, Sex, Addr, Phone, Mobile, EntryDate)
values (format(4, '0000000000'), 'Edwin', 'Ling', '2012/05/04', 'M', '19 Nathen Road', '22333444732', '22333444732','20220620')

insert into mstStudent (StudentID, GivenName, SurName, Birthday, Sex, Addr, Phone, Mobile, EntryDate)
values (format(5, '0000000000'), 'Joey', 'Dow', '2012/01/19', 'F', '19 Maiden Road', '22333444797', '22333444797','20220920')

insert into MstSubjectType values ('ENG', 'General English', 3)
insert into MstSubjectType values ('MATHS', 'General Mathmetics', 2)
insert into MstSubjectType values ('RELIGION', 'Regilious Study', 1)
insert into MstSubjectType values ('SCIENCE', 'Science', 1)
insert into MstSubjectType values ('GEOGRAPHY', 'Geography', 1)

insert into MstSubject values ('READING', 'English Reading', 'ENG', 0.4)
insert into MstSubject values ('COMPOSITION', 'English Composition', 'ENG', 0.4)
insert into MstSubject values ('LISTENING', 'English Listening', 'ENG', 0.2)
insert into MstSubject values ('MATHS', 'General Mathmetics', 'MATHS', 1)
insert into MstSubject values ('RELIGIOUS', 'Regilious Study', 'RELIGION', 1)
insert into MstSubject values ('SCIENCE', 'Science', 'SCIENCE', 1)
insert into MstSubject values ('GEOGRAPHY', 'Geography', 'GEOGRAPHY', 1)

insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(1, '0000000000'), 'ENG', 'READING', '2022', 'A', 80)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(2, '0000000000'), 'ENG', 'READING', '2022', 'A', 88)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(3, '0000000000'), 'ENG', 'READING', '2022', 'A', 67)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(4, '0000000000'), 'ENG', 'READING', '2022', 'A', 79)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(5, '0000000000'), 'ENG', 'READING', '2022', 'A', 53)

insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(1, '0000000000'), 'ENG', 'COMPOSITION', '2022', 'A', 98)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(2, '0000000000'), 'ENG', 'COMPOSITION', '2022', 'A', 90)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(3, '0000000000'), 'ENG', 'COMPOSITION', '2022', 'A', 70)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(4, '0000000000'), 'ENG', 'COMPOSITION', '2022', 'A', 75)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(5, '0000000000'), 'ENG', 'COMPOSITION', '2022', 'A', 78)


insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(1, '0000000000'), 'ENG', 'LISTENING', '2022', 'A', 87)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(2, '0000000000'), 'ENG', 'LISTENING', '2022', 'A', 80)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(3, '0000000000'), 'ENG', 'LISTENING', '2022', 'A', 83)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(4, '0000000000'), 'ENG', 'LISTENING', '2022', 'A', 79)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(5, '0000000000'), 'ENG', 'LISTENING', '2022', 'A', 60)

insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(1, '0000000000'), 'MATHS', 'MATHS', '2022', 'A', 90)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(2, '0000000000'), 'MATHS', 'MATHS', '2022', 'A', 95)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(3, '0000000000'), 'MATHS', 'MATHS', '2022', 'A', 83)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(4, '0000000000'), 'MATHS', 'MATHS', '2022', 'A', 88)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(5, '0000000000'), 'MATHS', 'MATHS', '2022', 'A', 82)


insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(1, '0000000000'), 'RELIGION', 'RELIGIOUS', '2022', 'A', 80)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(2, '0000000000'), 'RELIGION', 'RELIGIOUS', '2022', 'A', 70)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(3, '0000000000'), 'RELIGION', 'RELIGIOUS', '2022', 'A', 75)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(4, '0000000000'), 'RELIGION', 'RELIGIOUS', '2022', 'A', 81)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(5, '0000000000'), 'RELIGION', 'RELIGIOUS', '2022', 'A', 63)

insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(1, '0000000000'), 'SCIENCE', 'SCIENCE', '2022', 'A', 85)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(2, '0000000000'), 'SCIENCE', 'SCIENCE', '2022', 'A', 90)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(3, '0000000000'), 'SCIENCE', 'SCIENCE', '2022', 'A', 83)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(4, '0000000000'), 'SCIENCE', 'SCIENCE', '2022', 'A', 88)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(5, '0000000000'), 'SCIENCE', 'SCIENCE', '2022', 'A', 80)

insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(1, '0000000000'), 'GEOGRAPHY', 'GEOGRAPHY', '2022', 'A', 70)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(2, '0000000000'), 'GEOGRAPHY', 'GEOGRAPHY', '2022', 'A', 75)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(3, '0000000000'), 'GEOGRAPHY', 'GEOGRAPHY', '2022', 'A', 85)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(4, '0000000000'), 'GEOGRAPHY', 'GEOGRAPHY', '2022', 'A', 78)
insert into AcademicResult (StudentID, SubjectType, SubjectID, AcademicYear, Semester, Score)
	values (format(5, '0000000000'), 'GEOGRAPHY', 'GEOGRAPHY', '2022', 'A', 68)
