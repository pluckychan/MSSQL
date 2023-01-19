
create table TestResult (
	StudentName nvarchar(100),
	Subject nvarchar(100),
	Score numeric(18, 4)
)

insert into TestResult (StudentName, Subject, Score) values ('Joe', 'Maths', 80)
insert into TestResult (StudentName, Subject, Score) values ('Xavier', 'Maths', 98)
insert into TestResult (StudentName, Subject, Score) values ('Chole', 'Maths', 100)
insert into TestResult (StudentName, Subject, Score) values ('Hayden', 'Maths', 70)
insert into TestResult (StudentName, Subject, Score) values ('Edwin', 'Maths', 75)

insert into TestResult (StudentName, Subject, Score) values ('Joe', 'English', 96)
insert into TestResult (StudentName, Subject, Score) values ('Xavier', 'English', 80)
insert into TestResult (StudentName, Subject, Score) values ('Chole', 'English', 94)
insert into TestResult (StudentName, Subject, Score) values ('Hayden', 'English', 83)
insert into TestResult (StudentName, Subject, Score) values ('Edwin', 'English', 79)

insert into TestResult (StudentName, Subject, Score) values ('Joe', 'History', 77)
insert into TestResult (StudentName, Subject, Score) values ('Xavier', 'History', 82)
insert into TestResult (StudentName, Subject, Score) values ('Chole', 'History', 92)
insert into TestResult (StudentName, Subject, Score) values ('Hayden', 'History', 63)
insert into TestResult (StudentName, Subject, Score) values ('Edwin', 'History', 71)

insert into TestResult (StudentName, Subject, Score) values ('Joe', 'Religion', 88)
insert into TestResult (StudentName, Subject, Score) values ('Xavier', 'Religion', 85)
insert into TestResult (StudentName, Subject, Score) values ('Chole', 'Religion', 90)
insert into TestResult (StudentName, Subject, Score) values ('Hayden', 'Religion', 75)
insert into TestResult (StudentName, Subject, Score) values ('Edwin', 'Religion', 64)

select Subject, [Chole], [Xavier], [Joe], [Hayden], [Edwin]
from TestResult
pivot (
	avg(Score)
	for StudentName in ([Chole], [Xavier], [Joe], [Hayden], [Edwin])
) as pt
union all
select 'Average Score', [Chole], [Xavier], [Joe], [Hayden], [Edwin]
from (select StudentName, Score from TestResult) p
pivot (
	avg(Score)
	for StudentName in ([Chole], [Xavier], [Joe], [Hayden], [Edwin])
) as pt
