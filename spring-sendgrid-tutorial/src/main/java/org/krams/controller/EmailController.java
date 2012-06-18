package org.krams.controller;

import org.krams.domain.Message;
import org.krams.response.StatusResponse;
import org.krams.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/email")
public class EmailController {

	@Autowired
	private EmailService emailService;
	
	@RequestMapping
	public String form() {
		return "form";
	}
	
	@RequestMapping(value ="/send", method=RequestMethod.POST)
	public @ResponseBody StatusResponse send(@RequestBody Message message) {
		return emailService.send(message);
	}
}