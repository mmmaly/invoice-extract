# invoice-extract
Extract data from invoices

Extracts basic info from an invoice (so far focused on Slovak invoices). The invoice must be in text form (i.e after OCR). 
The following info is extracted:

* Invoice number
* ICO - Identification number (Slovak format = Czech format)
* DIC - Tax ID
* IC DPH - EU VAT ID
* IBAN
* Invoice total
* Variable symbol (for bank transfer)
* Date

Warning: This is work in progress. No warranty about extracted data.

License warning: 
I have not yet made my mind about the licence. **Until then, you are legally prohibited from using this code.**

I am a fan of FLOSS and I intent to release this code as open-source but I intent to specifically prohibit any **state agency** or any agency working **for the state** or **on state's behalf**, especially for the purpose of **tax collection or tax control**, from using this software.
I simply refuse to help the state to gain an advantage over its citizens, while the citizens must comply with complicated tax codes or other tax-related nonsense.
The reverse, is however ok: I have no objections if the citizens excercise control over the public instititions.

Intended allowed use is:
* processing your invoices (if you are not a state agency), or 
* processing invoices of your customers, where the direct customer, or indirect (customer's customer etc.) must not be a state agency, or 
* processing invoices of public institutions for the purpose of public control.

Prohibited use:
* processing invoices by state agency, or by any subject acting on its behalf



