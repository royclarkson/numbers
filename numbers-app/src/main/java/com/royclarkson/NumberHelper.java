/*
 * Copyright 2015 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.royclarkson;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class NumberHelper {

	@Autowired
	RestTemplate rest;

	@Value("${defaultNumber:0}")
	private Long defaultNumber;

	@HystrixCommand(fallbackMethod = "getDefaultNumber")
	public Number getNumber() {
		NumberMessage numberMessage = rest.getForObject("http://numbers-service/number", NumberMessage.class);
		return numberMessage.getNumber();
	}

	public Number getDefaultNumber() {
		return this.defaultNumber;
	}

}
