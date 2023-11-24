show tables;

create table board1(
	idx 		int not null auto_increment,	/* 게시물 고유번호 */
	nickName	varchar(15) not null,			/* 게시물 작성자 닉네임 */
	memberIdx	int not null,					/* 게시물 작성자의 고유 번호(닉네임은 수정이 되므로 게시물작성자가 정확히 누구인지 판별하기 위함) */
	title		varchar(100) not null,			/* 게시물 제목 */
	content		text not null,					/* 게시물 내용 */
	viewNum		int default 0,					/* 게시물 조회수 */
	good		int default 0,					/* 게시물 추천 */
	bad			int default 0,					/* 게시물 비추천 */
	writeDate	datetime default now(),			/* 게시물 작성일자 */
	
	primary key(idx)
);

drop table board1;
desc board1;
insert into board1 values(default,'관리자',1,'테스트 게시물','테스트입니다',default,default,default,default);
select * from board1;