package org.krams.service;

import org.krams.domain.Message;
import org.krams.response.StatusResponse;

public interface EmailService {
	StatusResponse send(Message message);
}
