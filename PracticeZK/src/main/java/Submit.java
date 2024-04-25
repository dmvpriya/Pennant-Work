package main.java;

import org.zkoss.zk.ui.util.Clients;

public class Submit {
	public void onSubmit() {
		Clients.evalJavaScript("alert('Registration Successful');");
	}

}
