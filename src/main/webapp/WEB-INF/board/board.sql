show tables;

create table board1(
	idx 		int not null auto_increment,	/* 게시물 고유번호 */
	nickName	varchar(15) not null,			/* 게시물 작성자 닉네임 */
	memberIdx	int not null,					/* 게시물 작성자의 고유 번호(닉네임은 수정이 되므로 게시물작성자가 정확히 누구인지 판별하기 위함) */
	title		varchar(100) not null,			/* 게시물 제목 */
	content		text not null,					/* 게시물 내용 */
	fName		varchar(200),					/* 게시물 원본 파일 이름 */
	fSName		varchar(200),					/* 게시물 시스템 파일 이름 */
	viewNum		int default 0,					/* 게시물 조회수 */
	good		int default 0,					/* 게시물 추천 */
	bad			int default 0,					/* 게시물 비추천 */
	boardType	varchar(10) default '일반',		/* 게시물 타입(공지사항, 일반게시물 구분) */
	writeDate	datetime default now(),			/* 게시물 작성일자 */
	
	primary key(idx)
);

drop table board1;
desc board1;
insert into board1 values(default,'홍길동',1,'안녕','더미데s이터',null,null,default,default,default,'일반',default);
select * from board1;

select board1.*,member1.level from board1 join member1 on board1.memberIdx = member1.idx;
select board1.*,member1.level,datediff(now(),writeDate) as dateDiff, timestampdiff(hour,writeDate,now()) as hourDiff from board1 join member1 on board1.memberIdx = member1.idx order by board1.idx desc