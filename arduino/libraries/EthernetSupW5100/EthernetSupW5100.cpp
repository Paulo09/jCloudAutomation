#include "w5100.h"
#include "EthernetSupW5100.h"
#include "Dhcp.h"
#include <avr/pgmspace.h>

#define P(name)	static const prog_uchar name[] PROGMEM

// XXX: don't make assumptions about the value of MAX_SOCK_NUM.
uint8_t EthernetClass::_state[MAX_SOCK_NUM] = { 0, 0, 0, 0 };
uint16_t EthernetClass::_server_port[MAX_SOCK_NUM] = { 0, 0, 0, 0 };

static Button     _button[MAX_BUTTONS];
static int			   _lastButton;
static int         _buttonId;

P(head_ini) = "<!DOCTYPE HTML>"
"<HTML>"
"<HEAD>"
"<meta charset='utf-8'>"
"<meta name='viewport' content='initial-scale=1'>"
"<link rel='stylesheet' href='http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css' />"
"<script src='http://code.jquery.com/jquery-1.9.1.min.js'></script>"
"<script src='http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js'></script>";
P(head_fim) = "</HEAD>"
"<BODY>";

P(div_ini) =
"<div data-role='content'><h3 align='center'>jMobile Automation</h3>"
"<ul data-role='listview' data-inset='true' data-filter='true' data-filter-placeholder-text='Limpar Campo' data-filter-placeholder='Buscar Menu'>";

P(div_fim) = "<p align='center' class='small'>"
//"<a href='#' class='small'>Paulo Castro</a></p>"
"</div>"
"</BODY>"
"</HTML>";

P(button_ini) = 
"<div data-role='content'><a data-role='button'  data-theme='a' href='";
P(button_mid1) = "' class='super button ";
P(button_mid2) = "'>";
P(button_fim) = "</a></div></p>";

P(stylesheet) = "";

EthernetClass::EthernetClass()
{
	_buttonId = -1;
	_lastButton = 0;
	for (int i = 0; i < MAX_BUTTONS; i++)
	{
		_button[i].id      = -1;
		_button[i].type    = UNKNOWN;
		_button[i].state   = STUNKNOWN;
		_button[i].flag    = 0;
		for (int j = 0; j < MAX_TEXT_BUTTON; j++)
		{
			_button[i].textOn[j]  = '\0';
			_button[i].textOff[j] = '\0';
		}
	}
}

int EthernetClass::begin(uint8_t *mac_address)
{
  _dhcp = new DhcpClass();
  W5100.init();
  W5100.setMACAddress(mac_address);
  W5100.setIPAddress(IPAddress(0,0,0,0).raw_address());

  // Now try to get our config info from a DHCP server
  int ret = _dhcp->beginWithDHCP(mac_address);
  if(ret == 1)
  {
    // We've successfully found a DHCP server and got our configuration info, so set things
    // accordingly
    W5100.setIPAddress(_dhcp->getLocalIp().raw_address());
    W5100.setGatewayIp(_dhcp->getGatewayIp().raw_address());
    W5100.setSubnetMask(_dhcp->getSubnetMask().raw_address());
    _dnsServerAddress = _dhcp->getDnsServerIp();
  }

  return ret;
}

void EthernetClass::begin(uint8_t *mac_address, IPAddress local_ip)
{
  // Assume the DNS server will be the machine on the same network as the local IP
  // but with last octet being '1'
  IPAddress dns_server = local_ip;
  dns_server[3] = 1;
  begin(mac_address, local_ip, dns_server);
}

void EthernetClass::begin(uint8_t *mac_address, IPAddress local_ip, IPAddress dns_server)
{
  // Assume the gateway will be the machine on the same network as the local IP
  // but with last octet being '1'
  IPAddress gateway = local_ip;
  gateway[3] = 1;
  begin(mac_address, local_ip, dns_server, gateway);
}

void EthernetClass::begin(uint8_t *mac_address, IPAddress local_ip, IPAddress dns_server, IPAddress gateway)
{
  IPAddress subnet(255, 255, 255, 0);
  begin(mac_address, local_ip, dns_server, gateway, subnet);
}

void EthernetClass::begin(uint8_t *mac, IPAddress local_ip, IPAddress dns_server, IPAddress gateway, IPAddress subnet)
{
  W5100.init();
  W5100.setMACAddress(mac);
  W5100.setIPAddress(local_ip._address);
  W5100.setGatewayIp(gateway._address);
  W5100.setSubnetMask(subnet._address);
  _dnsServerAddress = dns_server;
}

int EthernetClass::maintain(){
  int rc = DHCP_CHECK_NONE;
  if(_dhcp != NULL){
    //we have a pointer to dhcp, use it
    rc = _dhcp->checkLease();
    switch ( rc ){
      case DHCP_CHECK_NONE:
        //nothing done
        break;
      case DHCP_CHECK_RENEW_OK:
      case DHCP_CHECK_REBIND_OK:
        //we might have got a new IP.
        W5100.setIPAddress(_dhcp->getLocalIp().raw_address());
        W5100.setGatewayIp(_dhcp->getGatewayIp().raw_address());
        W5100.setSubnetMask(_dhcp->getSubnetMask().raw_address());
        _dnsServerAddress = _dhcp->getDnsServerIp();
        break;
      default:
        //this is actually a error, it will retry though
        break;
    }
  }
  return rc;
}

IPAddress EthernetClass::localIP()
{
  IPAddress ret;
  W5100.getIPAddress(ret.raw_address());
  return ret;
}

IPAddress EthernetClass::subnetMask()
{
  IPAddress ret;
  W5100.getSubnetMask(ret.raw_address());
  return ret;
}

IPAddress EthernetClass::gatewayIP()
{
  IPAddress ret;
  W5100.getGatewayIp(ret.raw_address());
  return ret;
}

IPAddress EthernetClass::dnsServerIP()
{
  return _dnsServerAddress;
}

void EthernetClass::addButton(int pin, char *texton, char *textoff, ButtonType type)
{
	if (type == FLIP_BUTTON)
	{
		addButton(pin, texton, textoff, type, DEACTIVATED);
	}
	else
	{
		addButton(pin, texton, textoff, type, STUNKNOWN);
	}
}

void EthernetClass::addButton(int pin, char *texton, char *textoff, ButtonType type, ButtonState state)
{
	int idx = _lastButton;
	if (idx < MAX_BUTTONS)
	{
		_button[idx].id    = pin;
		_button[idx].type  = type;
		_button[idx].state = state;
		_button[idx].flag  = 0;
		for (int j = 0; j < MAX_TEXT_BUTTON; j++)
		{
			if (texton[j] != '\0')
				_button[idx].textOn[j]  = texton[j];
			if (textoff[j] != '\0')
				_button[idx].textOff[j] = textoff[j];
		}
		_lastButton++;
	}
}


void EthernetClass::loadHtml(EthernetServer server)
{
  int requestCount = 0; 
  int buttonId = -1;
  char requestText[MAX_TEXT_BUTTON];
  
  for (int i = 0; i < MAX_TEXT_BUTTON; i++)
  {
    requestText[i] = '\0';
  }
  
  EthernetClient client = server.available();
  if (client) 
  {
    boolean currentLineIsBlank = true;
    while (client.connected()) 
    {
      if (client.available()) 
      {
        char c = client.read();
        
			// Pegando texto do request
			if (requestCount < (MAX_TEXT_BUTTON - 1))
			{
				requestText[requestCount] = c;
				requestCount++;
			}
			
        if (c == '\n' && currentLineIsBlank) 
        {
        	// Verifica se algum botao foi clicado
        	setButtonId(getButtonId(requestText));
        	if (_buttonId != -1)
        	{
        		if (_button[_buttonId].type == FLIP_BUTTON)
        		{
        			_button[_buttonId].state = 
        				ButtonState((_button[_buttonId].state == ACTIVATED) ? DEACTIVATED : ACTIVATED);
        		}
        	}
        	
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/html");
          client.println("Connnection: close");
          client.println();
          printP(client, head_ini);
          printP(client, stylesheet);
          printP(client, head_fim);
          printP(client, div_ini);

				for (int i = 0; i < MAX_BUTTONS; i++)
				{
					if (_button[i].type != UNKNOWN)
					{
					  printP(client, button_ini);
					  // link do botao
					  client.print("/?button_id=");
					  client.print(_button[i].id);
					  printP(client, button_mid1);
					  // cor do botao
					  if (_button[i].state == ACTIVATED)
					  {
					  	  client.print("</div>");
				 	  }
				 	  else
				 	  {
				 	  	  client.print("</div>");
				 	  }
					  printP(client, button_mid2);
					  // texto do botao
					  if (_button[i].state == ACTIVATED)
					  {
					  	  client.print(_button[i].textOff);
					  }
					  else
					  {
					  	  client.print(_button[i].textOn);
					  }
					  printP(client, button_fim);
	       		}
				}
				
          printP(client, div_fim);
          break;
        }
        if (c == '\n') 
        {
          currentLineIsBlank = true;
        } 
        else if (c != '\r') 
        {
          currentLineIsBlank = false;
        }
      }
    }
    delay(1);
    client.stop();
  }
}

int EthernetClass::getButtonId(char* requestText)
{
	int ret = 0;
	char c[] = { '\0', '\0', '\0' };
	int fatorDec = 0;	
	int found = -1;
	int idx;
	for (int i = 0; i < (MAX_TEXT_BUTTON - 11); i++)
	{
		if (strncmp("button_id=", (char*)&(requestText[i]), 10) == 0)
		{
			found = i;
			break;
		}
	}
	if (found != -1)
	{
		found += 10;
		for (int i = found; i < (MAX_TEXT_BUTTON - 11); i++)
		{
			if (strncmp(" HTTP/1.", (char*)&(requestText[i]), 8) == 0)
				break;
			else
				fatorDec++;
		}
		
		if (fatorDec > 0 && fatorDec <= 3)
		{
			idx = 0;
			for (int i = found; i < (found + fatorDec); i++)
			{
				c[idx++] = requestText[i];
			}
			
			for (int i = 0; i < fatorDec; i++)
			{
				if (i > 0) 
					ret *= 10;
				ret += c[i] - '0';
			}			
			
			return ret;
		}
	}
	return -1;
}

Button EthernetClass::getButton(int id)
{
	for (int i = 0; i < MAX_BUTTONS; i++)
	{
		if (_button[i].id == id)
		{
			return _button[i];
		}
	}
	Button bt;
	bt.id = -1;
	return bt;
}

void EthernetClass::setButtonId(int id)
{
	_buttonId = -1;
	for (int i = 0; i < MAX_BUTTONS; i++)
	{
		if (_button[i].id == id)
		{
			_buttonId = i;
			break;
		}
	}
}

int EthernetClass::getLastClickedButton()
{
	int id = _button[_buttonId].id;
	_buttonId = -1;
	return id;
}

byte EthernetClass::getButtonState(int id)
{
	for (int i = 0; i < MAX_BUTTONS; i++)
	{
		if (_button[i].id == id)
		{
			return ((_button[i].state == ACTIVATED) ? 1 : 0);
		}
	}
}

void EthernetClass::printP(EthernetClient client, const prog_uchar *str) 
{
	uint8_t buffer[32];
	size_t bufferEnd = 0;
	while(buffer[bufferEnd++] = pgm_read_byte(str++))
	{
		if (bufferEnd == 32)
		{
			client.write(buffer, 32);
			bufferEnd = 0;
		}
	}
	
	if (bufferEnd > 1) 
		client.write(buffer, bufferEnd - 1);
}

EthernetClass EthernetSupW5100;
