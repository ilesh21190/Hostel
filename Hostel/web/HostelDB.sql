create table HostelLogin (username varchar(30),password varchar(30),Usertype varchar(10))
insert into HostelLogin values('ilesh','123','admin')
create table Student (id serial,stuid varchar(100),name varchar(100),std numeric(2),Fromyear numeric(4),toYear numeric(4),mother varchar(100),father varchar(100),stucast varchar(20),subcast varchar(20),region varchar(30),nationality varchar(30),dob varchar(12),address varchar(500),fatherbus varchar(200),motwork varchar(200),stutel varchar(12),stumob varchar(12),sturel varchar(100),stutele varchar(12),sturelmob varchar(12),stuschool varchar(100),sturesult varchar(5),stuelergy varchar(500),stuextra varchar(500))
create table Exstudent (id serial,stuid varchar(100),name varchar(100),std numeric(2),Fromyear numeric(4),toYear numeric(4),mother varchar(100),father varchar(100),stucast varchar(20),subcast varchar(20),region varchar(30),nationality varchar(30),dob varchar(12),address varchar(500),fatherbus varchar(200),motwork varchar(200),stutel varchar(12),stumob varchar(12),sturel varchar(100),stutele varchar(12),sturelmob varchar(12),stuschool varchar(100),sturesult varchar(5),stuelergy varchar(500),stuextra varchar(500))
alter table student add column (status varchar(10) default 'Active')
create table StudentYear(studentid integer,nextyear integer,constraint f_year foreign key (studentid) references student(id))
alter table student add column status varchar(10) default 'Active'
create or replace function InsertYear () returns trigger as
$body$
	declare
	begin
		insert into StudentYear (studentid,nextYear) values(new.id,new.FromYear);
		return null;
	end;
$body$ language plpgsql
create trigger AfterInsertStudent after insert on student execute procedure InsertYear()

create table StudentPhotoPath (stuid varchar(100), photo_path varchar(200),type varchar(30))