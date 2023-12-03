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
	boardType	varchar(10) default '일반',		/* 게시물 타입(일반,공지) */
	writeDate	datetime default now(),			/* 게시물 작성일자 */
	
	primary key(idx)
);

drop table board1;
desc board1;
insert into board1 values(default,'김말숙s',3,'도배하지마','혼난다',null,null,default,10,default,'일반',default);
insert into board1 values(default,'홍길동',2,'도배해도되나요?','하세요~',null,null,default,default,default,'일반',default);
insert into board1 values(default,'관리자',1,'안녕','하세요~',null,null,default,default,default,'일반',default);
select * from board1;

create table boardReply(
	idx 		int not null auto_increment,		/* 댓글 고유번호 */
	nickName	varchar(15) not null,				/* 댓글작성자의 닉네임 */
	memberIdx	int not null,						/* 댓글작성자의 고유번호 */
	boardIdx	int not null,						/* 게시물 고유번호 */
	content 	text not null,						/* 댓글 내용 */
	boardType	varchar(10) not null,				/* 게시판 타입 */
	writeDate	datetime default now(),				/* 댓글 작성 시간 */
	changeCheck int default 0,						/* 댓글이 수정됐는지 체크 */
	
	primary key(idx),
	foreign key(boardIdx) references board1(idx) on delete cascade
);
desc boardReply;
drop table boardReply;
insert into boardReply values(default,'관리자',1,15,'도배',default,default,default);
select * from boardReply;

select board1.*,member1.level,count(boardReply.idx) as replyCnt from board1 join member1 on board1.memberIdx = member1.idx and board1.title like '%%' left join boardReply on board1.idx = boardReply.boardIdx and boardReply.boardType = '자유게시판' group by board1.idx order by board1.idx desc 
