CREATE DEFINER=`sa`@`%` PROCEDURE `t_m_add_room_linker`(
	_name nvarchar(40),
    _tel nvarchar(40),
    _mail nvarchar(100),
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
		SET @RetVal='物业接口人姓名不能为空';
	end if;
    if(_tel = null or _tel = '')
		then
        SET @RetCode='0';
		SET @RetVal='物业接口人电话';
	end if;
    if(_mail = null or _mail = '')
		then
        SET @RetCode='0';
		SET @RetVal='物业接口人邮箱';
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
    
    insert into `t_m_room_linker` (
        `name`,
        tel,
        mail,
        creater_id,
        creater_name,
        create_time,
        ou_id
    )
    select
		_name,
        _tel,
        _mail,
        _creater_id,
        _creater_name,
        NOW(),
        _ou_id;
    SELECT @RetVal AS RetVal, @RetCode AS RetCode ;
END