/*테이블 */

--- yongje -------------------------------------------------------------------------------------------------------------------------
-- job 테이블 create문
create table job (
    job_code varchar2(20) primary key,  -- 직무코드(PK)
    job_type varchar2(100) not null     -- 직무유형
);

-- mentoring 테이블 create문
create table mentoring (
    mentoring_code varchar2(20) primary key,    -- 멘토링코드(PK)
    mentoring_type varchar2(30) not null        -- 멘토링유형
);

-- job 테이블 insert문
insert into job values ('job_code_0', '인사/총무/노무');
insert into job values ('job_code_1', '마케팅/MD');
insert into job values ('job_code_2', '홍보/CSR');
insert into job values ('job_code_3', '영업/영업관리');
insert into job values ('job_code_4', '회계/재무/금융');
insert into job values ('job_code_5', '해외/기술영업');
insert into job values ('job_code_6', '유통/무역/구매');
insert into job values ('job_code_7', '전략/기획');
insert into job values ('job_code_8', 'IT개발');
insert into job values ('job_code_9', '서비스 기획/UI/UX');
insert into job values ('job_code_10', '디자인/예술');
insert into job values ('job_code_11', '미디어');
insert into job values ('job_code_12', '서비스');
insert into job values ('job_code_13', '연구/설계');
insert into job values ('job_code_14', '전문/특수');
insert into job values ('job_code_15', '교육/상담/컨설팅');
insert into job values ('job_code_16', '공무원/공공/비영리');
insert into job values ('job_code_17', '생산/품질/제조');
insert into job values ('job_code_18', '기타 사무');


-- mentoring 테이블 insert문
insert into mentoring values ('mentoring_code_0','직무');
insert into mentoring values ('mentoring_code_1','진로');
insert into mentoring values ('mentoring_code_2','스펙');
insert into mentoring values ('mentoring_code_3','외국어');
insert into mentoring values ('mentoring_code_4','면접/자소서');
insert into mentoring values ('mentoring_code_5','회사생활');
insert into mentoring values ('mentoring_code_6','창업');
insert into mentoring values ('mentoring_code_7','이직');
insert into mentoring values ('mentoring_code_8','기타');

-- meetingboard 테이블 create문
create table meetingboard (
    meeting_seq     number,         -- 모임번호(PK)
    job_code        varchar2(20),   -- 직무분야(FK)
    title           varchar2(500),  -- 제목
    subtitle        varchar2(1000),  -- 부제목
    content         varchar2(4000), -- 내용
    day             varchar2(50),   -- 일시
    starthour       varchar2(30),   -- 시작시간
    endhour         varchar2(30),   -- 종료시간
    address         varchar2(50),   -- 장소
    buildingname    varchar2(50),   -- 건물이름
    address_x       varchar2(50),   -- 위도
    address_y       varchar2(50),   -- 경도
    count           number,         -- 모집인원
    host            varchar2(50),   -- 주최
    price           number,         -- 참가비
    email           varchar2(100),   -- 멘토이메일(FK)
    state           number  default 0, -- 상태
    constraint PK_MEETINGBOARD primary key(meeting_seq),
    constraint FK_MEETINGBOARD foreign key(job_code) references job(job_code),
    constraint FK_MEETINGBOARD2 foreign key(email) references mentors_member(member_email)
);

-- meetingboard 시퀀스
create sequence seq_meetingboard nocache nocycle;

-- 안내사항 테이블
create table guide(
    guide_content   varchar2(1000),
    logtime date default sysdate
);

-- 안내사항 테이블 insert 문
insert into guide(guide_content) values ('확정된 분들에게는 참여 확정 안내 메일이 발송됩니다.');
insert into guide(guide_content) values ('사전 취소는 2일 전까지 가능합니다.');
insert into guide(guide_content) values ('무단 No-Show 시에는 참여 신청이 제한됩니다.');
insert into guide(guide_content) values ('주차지원은 불가능하니 대중교통을 이용해 주세요.');

---yangJaewoo-----------------------------------------------------------------------------------------------------

CREATE TABLE menteeboard(
     seq NUMBER NOT NULL,               -- 글번호
     nickname VARCHAR2(40) NOT NULL,       -- 이름
     email VARCHAR2(40),   -- 이메일
     subject VARCHAR2(255) NOT NULL,    -- 제목
     content VARCHAR2(4000) NOT NULL,   -- 내용
     job_code VARCHAR2(40),                  -- 직무유형 
     good NUMBER DEFAULT 0,
    
     ref NUMBER NOT NULL,               -- 그룹번호
     lev NUMBER DEFAULT 0 NOT NULL,     -- 단계
     step NUMBER DEFAULT 0 NOT NULL,    -- 글순서
     pseq NUMBER DEFAULT 0 NOT NULL,    -- 원글번호
     reply NUMBER DEFAULT 0 NOT NULL,   -- 답변수

     hit NUMBER DEFAULT 0,              -- 조회수
     logtime DATE DEFAULT SYSDATE
 );
 create SEQUENCE menteeboard_seq nocache nocycle;
 
 
 
