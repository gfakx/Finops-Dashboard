# REVISED Implementation Guide - Using CAD Values
## Executive Cloud FinOps Dashboard

---

# 🎯 **PHASE 1: VERIFY YOUR DATA STRUCTURE (5 minutes)**

## **Step 1.1: Confirm Your Column Layout**

### **What you're checking:** Ensure formulas reference correct CAD columns

### **Your Current Data Structure:**
```
A: Environment          (Keep as-is)
B: Date                 (Keep as-is) 
C: Charges_USD          (Reference only)
D-K: Other USD values   (Not used in dashboard)
L: Exchange_Rate        (Reference for validation)
M: Charges_CAD          (Not used directly)
N: Savings_Plan_CAD     (Used for savings calculations)
O: Bundle_Discount_CAD  (Used for savings calculations)  
P: Enterprise_Discount_CAD (Used for savings calculations)
Q: Credits_CAD          (Not used directly)
R: Gross_CAD           (PRIMARY - Used for gross calculations)
S: Taxes_CAD           (Not used directly)
T: Net_CAD             (PRIMARY - Used for net calculations)
U: SSC_Fee_CAD         (PRIMARY - Used for SSC tracking)
V: Account_Count       (Used for account tracking)
```

### **Verification:**
1. **Check that Column U (SSC_Fee_CAD)** has the formula `=R2*0.1` (or similar)
2. **Confirm your data goes through Column V**
3. **Note your sheet name** (replace "Data_Entry" in formulas below)

---

# 🎯 **PHASE 2: CREATING THE DASHBOARD SHEET (20 minutes)**

## **Step 2.1: Create New Dashboard Sheet**

### **Detailed Instructions:**
1. **Right-click on sheet tab** → Insert → Worksheet
2. **Rename to:** `Dashboard`
3. **Set up header:**
   - A1: `EXECUTIVE CLOUD FINANCIAL DASHBOARD`
   - A2: `Financial Year: Apr-2025 to Mar-2026`  
   - A3: `Last Updated:`
   - B3: `=TODAY()`

### **Format header:** Merge A1:H1, Bold, Size 16, Dark Blue background, White text

---

# 🎯 **PHASE 3: CONTROL SECTION (10 minutes)**

## **Step 3.1: Month Selection Controls**

### **Detailed Instructions:**
1. **Cell A5:** `Select Month for Detailed View:`
2. **Cell C5:** Create dropdown
   - Data → Data Validation → List
   - Source: `Apr-2025,May-2025,Jun-2025,Jul-2025,Aug-2025,Sep-2025,Oct-2025,Nov-2025,Dec-2025,Jan-2026,Feb-2026,Mar-2026`
   - Default: `May-2025`

---

# 🎯 **PHASE 4: FINANCIAL YEAR SUMMARY - UPDATED FORMULAS (25 minutes)**

## **Step 4.1: YTD Summary Using CAD Columns**

### **Create summary starting at row 10:**

**Row 10 - Total Gross Cost (CAD):**
- A10: `Total Gross Cost (CAD):`
- C10: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!B:B,"<="&DATE(2026,3,31))`

**Row 11 - Total Savings (CAD):**
- A11: `Total Savings (CAD):`
- C11: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!B:B,"<="&DATE(2026,3,31))+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!B:B,"<="&DATE(2026,3,31))+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!B:B,"<="&DATE(2026,3,31))`

**Row 12 - Total Net Cost (CAD):**
- A12: `Total Net Cost (CAD):`
- C12: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!B:B,"<="&DATE(2026,3,31))`

**Row 13 - Total SSC Fees (CAD):**
- A13: `Total SSC Fees (CAD):`
- C13: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!B:B,"<="&DATE(2026,3,31))`

**Row 14 - Total Final Cost:**
- A14: `Total Final Cost (CAD):`
- C14: `=C12+C13`

**Row 15 - Savings Rate:**
- A15: `Savings Rate:`
- C15: `=IF(C10>0,C11/C10,0)`

### **Format:** C10:C14 as Currency (CAD), C15 as Percentage

---

# 🎯 **PHASE 5: CURRENT MONTH SUMMARY - UPDATED FORMULAS (20 minutes)**

## **Step 5.1: Dynamic Current Month Using CAD Columns**

### **Create current month section starting at row 10:**

**Column E - Current Month Summary:**
- E8: `CURRENT MONTH SUMMARY`
- E9: `="Selected Month: "&C5`

**Row 10:**
- E10: `Gross Cost (CAD):`
- G10: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,C5)`

**Row 11:**
- E11: `Total Savings (CAD):`
- G11: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,C5)+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,C5)+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,C5)`

**Row 12:**
- E12: `Net Cost (CAD):`
- G12: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,C5)`

**Row 13:**
- E13: `SSC Fees (CAD):`
- G13: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,C5)`

**Row 14:**
- E14: `Final Cost (CAD):`
- G14: `=G12+G13`

**Row 15:**
- E15: `Savings Rate:`
- G15: `=IF(G10>0,G11/G10,0)`

### **Format:** G10:G14 as Currency (CAD), G15 as Percentage

---

# 🎯 **PHASE 6: AWS PREPAID CREDIT TRACKER - UPDATED (15 minutes)**

## **Step 6.1: Prepaid Balance Using CAD Net Values**

### **Create tracker starting at row 19:**

**Row 19:**
- A19: `Starting Balance (CAD):`
- C19: `6147000` *(Note: $4.5M USD × ~1.366 exchange rate)*

**Row 20:**
- A20: `YTD AWS Depletion (CAD):`
- C20: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!B:B,"<="&DATE(2026,3,31),Data_Entry!A:A,"AWS_ASEA")+SUMIFS(Data_Entry!T:T,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!B:B,"<="&DATE(2026,3,31),Data_Entry!A:A,"AWS_LZ")`

**Row 21:**
- A21: `Remaining Balance (CAD):`
- C21: `=C19-C20`

**Row 22:**
- A22: `Months Remaining (Est.):`
- C22: `=IF(C20>0,C21/(C20/2),999)`

### **Important Note:** 
- Uses **Column T (Net_CAD)** for depletion calculation
- Starting balance adjusted to CAD equivalent
- Only applies to AWS_ASEA and AWS_LZ

---

# 🎯 **PHASE 7: ENVIRONMENT BREAKDOWN - UPDATED FORMULAS (30 minutes)**

## **Step 7.1: Environment Table Using CAD Values**

### **Create table headers in row 26:**
```
A26: Environment | B26: Gross_CAD | C26: Net_CAD | D26: SSC_Fee_CAD | 
E26: Total_Cost | F26: Savings_CAD | G26: Savings_Rate | H26: Accounts
```

### **Environment formulas (starting row 27):**

**Row 27 (AWS_ASEA):**
- A27: `AWS_ASEA`
- B27: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`
- C27: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`
- D27: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`
- E27: `=C27+D27`
- F27: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`
- G27: `=IF(B27>0,F27/B27,0)`
- H27: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`

**Row 28 (AWS_LZ):**
- A28: `AWS_LZ`
- B28: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`
- C28: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`
- D28: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`
- E28: `=C28+D28`
- F28: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`
- G28: `=IF(B28>0,F28/B28,0)`
- H28: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`

**Row 29 (AWS_CPS):**
- A29: `AWS_CPS`
- B29: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`
- C29: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`
- D29: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`
- E29: `=C29+D29`
- F29: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`
- G29: `=IF(B29>0,F29/B29,0)`
- H29: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`

**Row 30 (AZURE_CORP):**
- A30: `AZURE_CORP`
- B30: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`
- C30: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`
- D30: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`
- E30: `=C30+D30`
- F30: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`
- G30: `=IF(B30>0,F30/B30,0)`
- H30: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`

**Row 31 (AZURE_DPM3):**
- A31: `AZURE_DPM3`
- B31: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`
- C31: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`
- D31: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`
- E31: `=C31+D31`
- F31: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`
- G31: `=IF(B31>0,F31/B31,0)`
- H31: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`

**Row 32 (TOTALS):**
- A32: `TOTALS`
- B32: `=SUM(B27:B31)`
- C32: `=SUM(C27:C31)`
- D32: `=SUM(D27:D31)`
- E32: `=SUM(E27:E31)`
- F32: `=SUM(F27:F31)`
- G32: `=IF(B32>0,F32/B32,0)`
- H32: `=SUM(H27:H31)`

### **Format:** B:F as Currency (CAD), G as Percentage

---

# 🎯 **PHASE 8: MONTH-OVER-MONTH ANALYSIS - UPDATED (20 minutes)**

## **Step 8.1: Comparison Using CAD Values**

### **Create analysis starting at row 34:**

**Row 36:**
- A36: `Previous Month:`
- C36: `=TEXT(DATE(YEAR(C5),MONTH(C5)-1,1),"mmm-yyyy")`

**Row 38:**
- A38: `Previous Month Total (CAD):`
- C38: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,C36)+SUMIFS(Data_Entry!U:U,Data_Entry!B:B,C36)`

**Row 39:**
- A39: `Current Month Total (CAD):`
- C39: `=G14`

**Row 40:**
- A40: `Change (CAD):`
- C40: `=C39-C38`

**Row 41:**
- A41: `Change (%):`
- C41: `=IF(C38>0,(C39-C38)/C38,0)`

---

# 🎯 **PHASE 9: CHARTS WITH CAD DATA (25 minutes)**

## **Step 9.1: Chart Data Using CAD Columns**

### **Create chart data table at row 44:**

```
A44: Month     | B44: Gross_CAD  | C44: Net_CAD   | D44: Final_Cost_CAD
A45: Apr-2025  | B45: [formula]  | C45: [formula] | D45: [formula]
A46: May-2025  | B46: [formula]  | C46: [formula] | D46: [formula]
```

**Formulas:**
- B45: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,"Apr-2025")`
- C45: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,"Apr-2025")`
- D45: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,"Apr-2025")+SUMIFS(Data_Entry!U:U,Data_Entry!B:B,"Apr-2025")`
- (Repeat for May-2025 in row 46)

### **Create charts:**
1. **Select A44:D46** → Insert → Line Chart
2. **Title:** "Monthly Cost Trends (CAD)"
3. **Second chart:** Environment distribution using A27:B31

---

# 🎯 **KEY DIFFERENCES FROM ORIGINAL GUIDE**

## **Updated Column References:**
- **Gross calculations:** Use Column R (Gross_CAD)
- **Net calculations:** Use Column T (Net_CAD)  
- **SSC calculations:** Use Column U (SSC_Fee_CAD)
- **Savings calculations:** Use Columns N, O, P (CAD discount values)
- **Account counts:** Use Column V
- **Environment names:** Use Column A
- **Dates:** Use Column B

## **Important Notes:**
1. **All monetary values now in CAD** - consistent reporting currency
2. **Exchange rate impact included** - reflects true local cost
3. **SSC fee calculated on CAD gross** - accurate fee calculation
4. **AWS prepaid balance adjusted** - converted to CAD equivalent
5. **All formulas reference CAD columns** - ensures consistency

## **Your Monthly Workflow Remains:**
1. **Add new month data** to your data sheet (continue current process)
2. **Ensure CAD conversion formulas** are copied down for new rows
3. **Go to Dashboard** → select new month in dropdown
4. **Review updated CAD figures**

**Implementation Time: 3-4 hours (one time)**  
**Monthly Updates: 5-10 minutes**

All calculations now properly use your CAD-converted values for accurate Canadian dollar reporting!