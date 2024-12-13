# **Merchant Details**

### **1. Merchant ID**
- **Attribute**: `merchant_id`, **Type**: `integer`, 8 characters  
- **Required**: ✅  
- **Description**:  
  The Merchant ID as provided by the Payfast system. This is used to uniquely identify the receiving account. You can find it on the merchant’s settings page.



### **2. Merchant Key**
- **Attribute**: `merchant_key`, **Type**: `string`  
- **Required**: ✅  
- **Description**:  
  The Merchant Key as provided by the Payfast system. It ensures that the transaction is directed to the correct account. Both the ID and Key must be correct for the transaction to proceed. Available on the merchant’s settings page.



### **3. Return URL**
- **Attribute**: `return_url`,**Type**: `string`  
- **Length**: No character limit  
- **Required**: ❌ (Optional)  
- **Description**:  
  The URL where the user is redirected after a successful payment.



### **4. Cancel URL**
- **Attribute**: `cancel_url`, **Type**: `string`  
- **Length**: No character limit  
- **Required**: ❌ (Optional)  
- **Description**:  
  The URL where the user is redirected if they choose to cancel their payment while on the Payfast system.



### **5. Notify URL**
- **Attribute**: `notify_url`, **Type**: `string`  
- **Length**: No character limit  
- **Required**: ❌ (Optional)  
- **Description**:  
  The URL where Payfast sends notifications regarding the transaction status.


# **Customer Details**

### **1. First Name**
- **Attribute**: `name_first`  
- **Type**: `string`  
- **Length**: 100 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  The customer’s first name.



### **2. Last Name**
- **Attribute**: `name_last`  
- **Type**: `string`  
- **Length**: 100 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  The customer’s last name.



### **3. Email Address**
- **Attribute**: `email`  
- **Type**: `string`  
- **Length**: 100 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  The customer’s email address.



### **4. Cell Number**
- **Attribute**: `cell_number`  
- **Type**: `string`  
- **Length**: 100 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  If the `email_address` field is empty and `cell_number` is provided, the system uses the cell number as the username. The system will auto-login the user if they do not have a registered account.


# **Transaction Details**

### **1. Merchant Payment ID**
- **Attribute**: `m_payment_id`  
- **Type**: `string`  
- **Length**: 100 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  Unique payment ID on the merchant’s system.



### **2. Amount**
- **Attribute**: `amount`  
- **Type**: `decimal`  
- **Required**: ✅ (Required)  
- **Description**:  
  The amount which the payer must pay in ZAR.



### **3. Item Name**
- **Attribute**: `item_name`  
- **Type**: `string`  
- **Length**: 100 characters  
- **Required**: ✅ (Required)  
- **Description**:  
  The name of the item being charged for, or in the case of multiple items, the order number.



### **4. Item Description**
- **Attribute**: `item_description`  
- **Type**: `string`  
- **Length**: 255 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  The description of the item being charged for, or in the case of multiple items, the order description.



### **5. Metadata - integers**
- **Attribute**: `metadata_int<1..5>`  
- **Type**: `integer`  
- **Length**: 255 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  A series of 5 custom integer variables used to pass additional information (`metadata_int1`, `metadata_int2`, …) which can be used by the merchant as pass-through variables.  
  - They will be posted back to the merchant at the completion of the transaction.



### **6. Metadata - strings**
- **Attribute**: `metadata_str<1..5>`  
- **Type**: `string`  
- **Length**: 255 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  A series of 5 custom string variables used to pass additional information (`metadata_str1`, `metadata_str2`, …) which can be used by the merchant as pass-through variables.  
  - They will be posted back to the merchant at the completion of the transaction.


# **Transaction Options**

### **1. Email Confirmation**
- **Attribute**: `email_confirmation`  
- **Type**: `boolean`  
- **Length**: 1 character  
- **Required**: ❌ (Optional)  
- **Description**:  
  Whether to send an email confirmation to the merchant of the transaction. The email confirmation is automatically sent to the payer.  




### **2. Confirmation Address**
- **Attribute**: `email_confirmation_address`  
- **Type**: `string`  
- **Length**: 100 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  The email address to send the confirmation email to. Set this value in your payfast config file in your application. Using this field will override the value set in your Payfast account for this transaction.

# **Payment Methods**

- **Attribute**: `payment_method`  
- **Type**: `symbol`  
- **Length**: 3 characters  
- **Required**: ❌ (Optional)  
- **Description**:  
  When this field is set, only the SINGLE payment method specified can be used when the customer reaches Payfast. If this field is blank, or not included, then all available payment methods will be shown.

  **Accepted Values**:  
  - `ef` – EFT  
  - `cc` – Credit card  
  - `dc` – Debit card  
  - `mp` – Masterpass Scan to Pay  
  - `mc` – Mobicred  
  - `sc` – SCode  
  - `ss` – SnapScan  
  - `zp` – Zapper  
  - `mt` – MoreTyme  
  - `rc` – Store card  
  - `mu` – Mukuru  
  - `ap` – Apple Pay  
  - `sp` – Samsung Pay  
  - `cp` – Capitec Pay
