CREATE DEFINER=`sa`@`%` PROCEDURE `t_m_add_meeting_room`(
	_name nvarchar(40),
    _ou_id int(11),
    _type_id int(11),
    _capacity int(11),
    _tag nvarchar(2),
    _equipment nvarchar(200),
    _requirement nvarchar(200),
    _book_period tinyint(4),
    _photo nvarchar(200),
    _description nvarchar(200),
    _creater_id nvarchar(40),
    _creater_name nvarchar(40)
)
BEGIN
	SET NAMES utf8;
	SET @RetCode='1';
	SET @RetVal='1';
    
    if(_name = null or _name = '')
		then
        SET @RetCode='0';
		SET @RetVal='会议室名称不能为空';
	end if;
    if(_ou_id = null or _ou_id = 0)
		then
        SET @RetCode='0';
		SET @RetVal='组织机构id不能为空';
	end if;
    if(_type_id = null or _type_id = 0)
		then
        SET @RetCode='0';
		SET @RetVal='会议室类型id不能为空';
	end if;
    if(_capacity = null or _capacity = 0)
		then
        SET @RetCode='0';
		SET @RetVal='会议室容量不能为空';
	end if;
    if(_tag = null or _tag = '')
		then
        SET @RetCode='0';
		SET @RetVal='会议室可用标志不能为空';
	end if;
    if(_book_period = null or _book_period = 0)
		then
        SET @RetCode='0';
		SET @RetVal='会议室可预订时间范围不能为空';
	end if;
    if(_creater_id = null or _creater_id = '')
		then
        SET @RetCode='0';
		SET @RetVal='创建人id不能为空';
	end if;
    if(_creater_name = null or _creater_name = '')
		then
        SET @RetCode='0';
		SET @RetVal='创建人姓名不能为空';
	end if;
    
    if(@RetCode = '1')
		then
        insert into `t_m_meeting_room` (
			`name`,
            type_id,
            capacity,
            tag,
            equipment,
            requirement,
            book_period,
            photo,
            description,
            ou_id,
            creater_id,
			creater_name,
            create_time
		) select
			_name,
            _type_id,
            _capacity,
            _tag,
            _equipment,
            _requirement,
            _book_period,
            _photo,
            _description,
            _ou_id,
            _creater_id,
            _creater_name,
            NOW();
	end if;
    SELECT @RetVal AS RetVal, @RetCode AS RetCode ;       
END