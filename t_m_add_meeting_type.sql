CREATE DEFINER=`sa`@`%` PROCEDURE `t_m_add_meeting_type`(
	_name nvarchar(40),
    _creater_id nvarchar(40),
    _creater_name nvarchar(40),
    _ou_id int(11)
)
BEGIN
	SET NAMES utf8;
	SET @RetCode='1';
	SET @RetVal='1';
    
    if(_name = null or _name = '')
		then
        SET @RetCode='0';
		SET @RetVal='会议类型名称不能为空';
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
    if(_ou_id = null or _ou_id = 0)
		then
        SET @RetCode='0';
		SET @RetVal='组织机构id不能为空';
	end if;
    
    if(@RetCode = '1')
		then
        insert into `t_m_meeting_type` (
			`name`,
            creater_id,
			creater_name,
            ou_id,
            create_time
		) select
			_name,
            _creater_id,
            _creater_name,
            _ou_id,
            NOW();
     end if;       
     SELECT @RetVal AS RetVal, @RetCode AS RetCode ;       
END