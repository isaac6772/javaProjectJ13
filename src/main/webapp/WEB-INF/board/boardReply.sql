show tables;

create table boardReply(
	idx 		int not null auto_increment,		/* 댓글 고유번호 */
	nickName	varchar(15) not null,				/* 댓글작성자의 닉네임 */
	memberIdx	int not null,						/* 댓글작성자의 고유번호 */
	boardIdx	int not null,						/* 게시물 고유번호 */
	content 	text not null,						/* 댓글 내용 */
	boardType	varchar(20) not null,				/* 게시판 타입(자유게시판, 친구) */
	writeDate	datetime default now(),				/* 댓글 작성 시간 */
	changCheck 	int default 0,						/* 댓글이 수정됐는지 체크 */
	
	primary key(idx)
);
desc boardReply;
insert into boardReply values(default,'관리자',1,1,'일빠요~','board1',default,default);
select * from boardReply;