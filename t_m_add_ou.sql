CREATE DEFINER=`sa`@`%` PROCEDURE `t_m_add_ou`(
	_name nvarchar(40),
    _address nvarchar(60),
    _tel nvarchar(40),
    _description nvarchar(60),
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
		SET @RetVal='名称不能为空';
	end if;
    if(_address = null or _address = '')
		then
        SET @RetCode='0';
		SET @RetVal='地址不能为空';
	end if;
    if(_tel = null or _tel = '')
		then
        SET @RetCode='0';
		SET @RetVal='电话不能为空';
	end if;
    if(_description = null or _description = '')
		then
        SET @RetCode='0';
		SET @RetVal='简介不能为空';
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
		insert into `t_m_ou` (
			`name`,
			address,
			tel,
			description,
			creater_id,
			creater_name,
			create_time
		) select
			_name,
			_address,
			_tel,
			_description,
			_creater_id,
			_creater_name,
			NOW();
	end if;
    SELECT @RetVal AS RetVal, @RetCode AS RetCode ;
END