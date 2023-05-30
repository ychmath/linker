package com.linker.payment.dao;

import com.linker.login.dto.LoginDto;

public interface QrSendDao {
	LoginDto getUserById(String userid);
}
