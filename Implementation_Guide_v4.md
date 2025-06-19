# SIMPLIFIED Implementation Guide - Using Totals Row
## Executive Cloud FinOps Dashboard

---

# 🎯 **PHASE 1: SET UP TOTALS ROW IN DATA SHEET (10 minutes)**

## **Step 1.1: Create Totals Row in Your Data Sheet**

### **What you're doing:** Adding a summary row that totals all your data

### **Detailed Instructions:**

1. **Go to your Data_Entry sheet** (the one with your cost data)

2. **Navigate to Row 55** (or the row after your last data entry)

3. **In Cell A55, type:** `TOTALS`

4. **Create sum formulas for each column starting in Row 55:**

   **Column R (Gross_CAD) - Cell R55:**
   ```excel
   =SUM(R2:R54)
   ```
   
   **Column T (Net_CAD) - Cell T55:**
   ```excel
   =SUM(T2:T54)
   ```
   
   **Column U (SSC_Fee_CAD) - Cell U55:**
   ```excel
   =SUM(U2:U54)
   ```
   
   **Column N (Savings_Plan_CAD) - Cell N55:**
   ```excel
   =SUM(N2:N54)
   ```
   
   **Column O (Bundle_Discount_CAD) - Cell O55:**
   ```excel
   =SUM(O2:O54)
   ```
   
   **Column P (Enterprise_Discount_CAD) - Cell P55:**
   ```excel
   =SUM(P2:P54)
   ```
   
   **Column V (Account_Count) - Cell V55:**
   ```excel
   =SUM(V2:V54)
   ```

5. **Format Row 55:**
   - Select entire Row 55
   - Make it **Bold**
   - Add **Top and Bottom borders**
   - Use **different background color** (light blue or gray)

### **What this accomplishes:**
- Creates a single reference point for all totals
- Dashboard formulas become simple cell references
- Automatically updates when you add new data
- Easy to verify totals at a glance

---

# 🎯 **PHASE 2: CREATE DASHBOARD SHEET STRUCTURE (15 minutes)**

## **Step 2.1: Set Up New Dashboard Sheet**

### **What you're doing:** Creating the executive dashboard layout

### **Detailed Instructions:**

1. **Create new worksheet:**
   - Right-click on sheet tab → Insert → Worksheet
   - Rename to: `Dashboard`

2. **Create header section:**
   
   **Row 1:**
   - Cell A1: `EXECUTIVE CLOUD FINANCIAL DASHBOARD`
   - Select A1:H1 → Merge & Center
   - Format: Bold, Size 16, Dark Blue background, White text

   **Row 2:**
   - Cell A2: `Financial Year: Apr-2025 to Mar-2026`
   - Select A2:H2 → Merge & Center
   - Format: Bold, Size 12, Light Blue background

   **Row 3:**
   - Cell A3: `Last Updated:`
   - Cell C3: `=TODAY()`
   - Format C3: Date format

### **What this accomplishes:**
- Professional header for executive presentations
- Clear identification of reporting period
- Automatic last updated timestamp

---

# 🎯 **PHASE 3: CREATE CONTROL SECTION (10 minutes)**

## **Step 3.1: Add Month Selection Dropdown**

### **What you're doing:** Adding controls to filter data by month

### **Detailed Instructions:**

1. **Create month selector:**
   
   **Row 5:**
   - Cell A5: `Select Month for Detailed View:`
   - Cell C5: (We'll add dropdown here)

2. **Set up dropdown in C5:**
   - Select Cell C5
   - Go to **Data tab** → **Data Validation**
   - In "Allow" dropdown: Select **List**
   - In "Source" box, type:
     ```
     Apr-2025,May-2025,Jun-2025,Jul-2025,Aug-2025,Sep-2025,Oct-2025,Nov-2025,Dec-2025,Jan-2026,Feb-2026,Mar-2026
     ```
   - Click **OK**

3. **Set default value:**
   - In Cell C5, select: `May-2025` (or current month)

### **What this accomplishes:**
- Allows executives to view specific months
- Will be used for detailed monthly breakdowns
- Simple dropdown interface

---

# 🎯 **PHASE 4: FINANCIAL YEAR SUMMARY SECTION (15 minutes)**

## **Step 4.1: Create YTD Summary Using Totals Row**

### **What you're doing:** Showing total financial year performance using simple references

### **Detailed Instructions:**

1. **Create section header:**
   
   **Row 8:**
   - Cell A8: `FINANCIAL YEAR SUMMARY (Apr-2025 to Mar-2026)`
   - Format: Bold, Size 14, underline

2. **Create summary table starting at Row 10:**

   **Row 10 - Total Gross Cost:**
   - Cell A10: `Total Gross Cost (CAD):`
   - Cell C10: `=Data_Entry!R55`

   **Row 11 - Total Savings:**
   - Cell A11: `Total Savings (CAD):`
   - Cell C11: `=Data_Entry!N55+Data_Entry!O55+Data_Entry!P55`

   **Row 12 - Total Net Cost:**
   - Cell A12: `Total Net Cost (CAD):`
   - Cell C12: `=Data_Entry!T55`

   **Row 13 - Total SSC Fees:**
   - Cell A13: `Total SSC Fees (CAD):`
   - Cell C13: `=Data_Entry!U55`

   **Row 14 - Total Final Cost:**
   - Cell A14: `Total Final Cost (CAD):`
   - Cell C14: `=C12+C13`

   **Row 15 - Savings Rate:**
   - Cell A15: `Savings Rate:`
   - Cell C15: `=IF(C10>0,C11/C10,0)`

3. **Format the numbers:**
   - Select **C10:C14** → Format as **Currency** with **$ symbol**
   - Select **C15** → Format as **Percentage** with **1 decimal place**

4. **Add borders and styling:**
   - Select **A10:C15**
   - Add **All Borders**
   - Make **Row 15 bold** (totals row)

### **What this accomplishes:**
- Simple formulas that reference your totals row
- Automatic updates when you add new monthly data
- Clear financial year overview for executives

---

# 🎯 **PHASE 5: CURRENT MONTH SUMMARY SECTION (20 minutes)**

## **Step 5.1: Create Dynamic Monthly Summary**

### **What you're doing:** Showing selected month details using SUMIFS

### **Detailed Instructions:**

1. **Create section header:**
   
   **Row 8 (Column E):**
   - Cell E8: `CURRENT MONTH SUMMARY`
   - Cell E9: `="Selected Month: "&C5`

2. **Create monthly summary starting at Row 10:**

   **Row 10 - Monthly Gross:**
   - Cell E10: `Gross Cost (CAD):`
   - Cell G10: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,C5)`

   **Row 11 - Monthly Savings:**
   - Cell E11: `Total Savings (CAD):`
   - Cell G11: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,C5)+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,C5)+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,C5)`

   **Row 12 - Monthly Net:**
   - Cell E12: `Net Cost (CAD):`
   - Cell G12: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,C5)`

   **Row 13 - Monthly SSC:**
   - Cell E13: `SSC Fees (CAD):`
   - Cell G13: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,C5)`

   **Row 14 - Monthly Final:**
   - Cell E14: `Final Cost (CAD):`
   - Cell G14: `=G12+G13`

   **Row 15 - Monthly Savings Rate:**
   - Cell E15: `Savings Rate:`
   - Cell G15: `=IF(G10>0,G11/G10,0)`

3. **Format the numbers:**
   - Select **G10:G14** → Format as **Currency**
   - Select **G15** → Format as **Percentage**

### **What this accomplishes:**
- Shows performance for the selected month
- Updates automatically when you change month in C5
- Allows month-to-month comparison

---

# 🎯 **PHASE 6: AWS PREPAID CREDIT TRACKER (15 minutes)**

## **Step 6.1: Create Prepaid Balance Monitor**

### **What you're doing:** Tracking AWS prepaid credit depletion

### **Detailed Instructions:**

1. **Create section header:**
   
   **Row 17:**
   - Cell A17: `AWS PREPAID CREDIT TRACKER`
   - Format: Bold, Size 14, Blue text

2. **Create prepaid tracking starting at Row 19:**

   **Row 19 - Starting Balance:**
   - Cell A19: `Starting Balance (CAD):`
   - Cell C19: `6147000`
   *(Note: Adjust this to your actual CAD starting balance)*

   **Row 20 - YTD Depletion:**
   - Cell A20: `YTD AWS Depletion (CAD):`
   - Cell C20: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!A:A,"AWS_ASEA")+SUMIFS(Data_Entry!T:T,Data_Entry!B:B,">="&DATE(2025,4,1),Data_Entry!A:A,"AWS_LZ")`

   **Row 21 - Remaining Balance:**
   - Cell A21: `Remaining Balance (CAD):`
   - Cell C21: `=C19-C20`

   **Row 22 - Burn Rate:**
   - Cell A22: `Monthly Burn Rate (Avg):`
   - Cell C22: `=C20/2`
   *(Dividing by 2 since you have 2 months of data)*

   **Row 23 - Months Remaining:**
   - Cell A23: `Estimated Months Left:`
   - Cell C23: `=IF(C22>0,C21/C22,999)`

3. **Add conditional formatting for alerts:**
   - Select **C21** (Remaining Balance)
   - **Home tab** → **Conditional Formatting** → **New Rule**
   - Choose "Format only cells that contain"
   - Set: **Cell Value less than 1000000** → **Red background**
   - Add another rule: **Cell Value less than 2000000** → **Yellow background**

### **What this accomplishes:**
- Monitors AWS prepaid credit consumption
- Provides early warning of credit depletion
- Shows burn rate and estimated timeline

---

# 🎯 **PHASE 7: ENVIRONMENT BREAKDOWN TABLE (25 minutes)**

## **Step 7.1: Create Dynamic Environment Table**

### **What you're doing:** Showing detailed breakdown by each environment

### **Detailed Instructions:**

1. **Create section header:**
   
   **Row 25:**
   - Cell A25: `="ENVIRONMENT BREAKDOWN - "&C5`
   - Format: Bold, Size 13

2. **Create table headers in Row 27:**
   ```
   A27: Environment    | B27: Gross_CAD     | C27: Net_CAD      | D27: SSC_Fee_CAD
   E27: Total_Cost     | F27: Savings_CAD   | G27: Savings_Rate | H27: Accounts
   ```

3. **Create environment data rows (Row 28-32):**

   **Row 28 - AWS_ASEA:**
   - A28: `AWS_ASEA`
   - B28: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`
   - C28: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`
   - D28: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`
   - E28: `=C28+D28`
   - F28: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`
   - G28: `=IF(B28>0,F28/B28,0)`
   - H28: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_ASEA")`

   **Row 29 - AWS_LZ:**
   - A29: `AWS_LZ`
   - B29: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`
   - C29: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`
   - D29: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`
   - E29: `=C29+D29`
   - F29: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`
   - G29: `=IF(B29>0,F29/B29,0)`
   - H29: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_LZ")`

   **Row 30 - AWS_CPS:**
   - A30: `AWS_CPS`
   - B30: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`
   - C30: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`
   - D30: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`
   - E30: `=C30+D30`
   - F30: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`
   - G30: `=IF(B30>0,F30/B30,0)`
   - H30: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AWS_CPS")`

   **Row 31 - AZURE_CORP:**
   - A31: `AZURE_CORP`
   - B31: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`
   - C31: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`
   - D31: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`
   - E31: `=C31+D31`
   - F31: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`
   - G31: `=IF(B31>0,F31/B31,0)`
   - H31: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_CORP")`

   **Row 32 - AZURE_DPM3:**
   - A32: `AZURE_DPM3`
   - B32: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`
   - C32: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`
   - D32: `=SUMIFS(Data_Entry!U:U,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`
   - E32: `=C32+D32`
   - F32: `=SUMIFS(Data_Entry!N:N,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")+SUMIFS(Data_Entry!O:O,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")+SUMIFS(Data_Entry!P:P,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`
   - G32: `=IF(B32>0,F32/B32,0)`
   - H32: `=SUMIFS(Data_Entry!V:V,Data_Entry!B:B,$C$5,Data_Entry!A:A,"AZURE_DPM3")`

   **Row 33 - TOTALS:**
   - A33: `TOTALS`
   - B33: `=SUM(B28:B32)`
   - C33: `=SUM(C28:C32)`
   - D33: `=SUM(D28:D32)`
   - E33: `=SUM(E28:E32)`
   - F33: `=SUM(F28:F32)`
   - G33: `=IF(B33>0,F33/B33,0)`
   - H33: `=SUM(H28:H32)`

4. **Format the table:**
   - Select **A27:H33**
   - **Home tab** → **Format as Table** → Choose professional style
   - Format **B:F columns** as **Currency**
   - Format **G column** as **Percentage**
   - Make **Row 33 bold** (totals)

### **What this accomplishes:**
- Detailed breakdown by environment for selected month
- Automatic calculation of totals and percentages
- Professional table formatting for executive review

---

# 🎯 **PHASE 8: MONTH-OVER-MONTH ANALYSIS (15 minutes)**

## **Step 8.1: Create Comparison Analysis**

### **What you're doing:** Showing change from previous month

### **Detailed Instructions:**

1. **Create section header:**
   
   **Row 35:**
   - Cell A35: `MONTH-OVER-MONTH ANALYSIS`

2. **Create helper formula for previous month:**
   
   **Row 37:**
   - Cell A37: `Previous Month:`
   - Cell C37: `=TEXT(DATE(YEAR(C5),MONTH(C5)-1,1),"mmm-yyyy")`

3. **Create comparison metrics:**

   **Row 39 - Previous Month Total:**
   - Cell A39: `Previous Month Total (CAD):`
   - Cell C39: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,C37)+SUMIFS(Data_Entry!U:U,Data_Entry!B:B,C37)`

   **Row 40 - Current Month Total:**
   - Cell A40: `Current Month Total (CAD):`
   - Cell C40: `=G14`

   **Row 41 - Dollar Change:**
   - Cell A41: `Change (CAD):`
   - Cell C41: `=C40-C39`

   **Row 42 - Percentage Change:**
   - Cell A42: `Change (%):`
   - Cell C42: `=IF(C39>0,(C40-C39)/C39,0)`

4. **Add conditional formatting:**
   - Select **C41:C42**
   - **Conditional Formatting** → **Icon Sets** → **Arrows**
   - Green up arrow for positive, red down for negative

### **What this accomplishes:**
- Shows growth or decline from previous month
- Automatic calculation of previous month
- Visual indicators for performance direction

---

# 🎯 **PHASE 9: CREATE BASIC CHARTS (20 minutes)**

## **Step 9.1: Monthly Trend Chart**

### **What you're doing:** Creating visual representation of cost trends

### **Detailed Instructions:**

1. **Create chart data table:**
   
   **Starting at Row 45:**
   ```
   A45: Month      | B45: Gross_CAD  | C45: Net_CAD   | D45: Final_Cost_CAD
   A46: Apr-2025   | B46: [formula]  | C46: [formula] | D46: [formula]
   A47: May-2025   | B47: [formula]  | C47: [formula] | D47: [formula]
   ```

2. **Add formulas for chart data:**
   
   **Row 46 (Apr-2025):**
   - B46: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,"Apr-2025")`
   - C46: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,"Apr-2025")`
   - D46: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,"Apr-2025")+SUMIFS(Data_Entry!U:U,Data_Entry!B:B,"Apr-2025")`

   **Row 47 (May-2025):**
   - B47: `=SUMIFS(Data_Entry!R:R,Data_Entry!B:B,"May-2025")`
   - C47: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,"May-2025")`
   - D47: `=SUMIFS(Data_Entry!T:T,Data_Entry!B:B,"May-2025")+SUMIFS(Data_Entry!U:U,Data_Entry!B:B,"May-2025")`

3. **Create the chart:**
   - Select range **A45:D47**
   - **Insert tab** → **Charts** → **Line Chart** → **Line with Markers**
   - Move chart to desired location (e.g., to the right of your tables)

4. **Format the chart:**
   - Right-click chart → **Add Chart Title** → Type: "Monthly Cost Trends (CAD)"
   - Right-click chart → **Select Data** → Verify series names
   - Format axes if needed

### **What this accomplishes:**
- Visual trend analysis for executives
- Shows gross vs net vs final cost progression
- Easy to update as you add more months

---

# 🎯 **PHASE 10: FINAL FORMATTING & TESTING (15 minutes)**

## **Step 10.1: Professional Formatting**

### **What you're doing:** Making the dashboard executive-ready

### **Detailed Instructions:**

1. **Apply consistent formatting:**
   
   **Section Headers:**
   - Make all section headers **Bold, Size 13-14**
   - Apply **Blue text color**
   - Add **underline** or **bottom border**

   **Currency Formatting:**
   - All monetary columns: **Currency format with $ symbol**
   - Format: **$#,##0** (no decimal places for clean look)

   **Percentage Formatting:**
   - All rate columns: **Percentage format with 1 decimal place**
   - Format: **0.0%**

2. **Add borders and spacing:**
   - Add **borders around each major section**
   - Use **thick borders** for section separators
   - Add **extra row spacing** between sections

3. **Color coding:**
   - **AWS rows:** Light orange/yellow background
   - **Azure rows:** Light blue background
   - **Totals rows:** Gray background
   - **Warning cells:** Red background for low balances

## **Step 10.2: Test Your Dashboard**

### **Testing procedure:**

1. **Test month selection:**
   - Change month in **C5** to different values
   - Verify all numbers update correctly
   - Check that environment table shows correct month data

2. **Test totals accuracy:**
   - Compare dashboard totals with your data sheet totals (Row 55)
   - Verify YTD summary matches sum of all months

3. **Add test data:**
   - Add a new month of data to your data sheet
   - Update totals row formulas to include new data
   - Check that dashboard picks up new data

## **Step 10.3: Create Refresh Process**

### **Simple refresh procedure:**

1. **Add new month data** to data sheet (continue your current process)
2. **Update totals row range** if needed (e.g., change SUM(R2:R54) to SUM(R2:R60))
3. **Go to Dashboard** → Select new month in dropdown
4. **Verify all calculations**

---

# 🎯 **SUMMARY: YOUR COMPLETED DASHBOARD**

## **✅ What You've Built:**

### **Executive Summary Section:**
- **Financial Year Totals** using simple references to Row 55
- **Current Month Details** with dropdown selection
- **AWS Prepaid Credit Tracker** with depletion monitoring

### **Detailed Analysis:**
- **Environment Breakdown Table** showing all 5 environments
- **Month-over-Month Comparison** with automatic calculations
- **Visual Charts** for trend analysis

### **Key Features:**
- **Simple formulas** using your totals row approach
- **Automatic updates** when you add new data
- **Professional formatting** for executive presentations
- **CAD currency** throughout for consistent reporting
- **Flexible month selection** for detailed analysis

## **⏱️ Time Investment:**

### **One-Time Setup:** 2.5-3 hours
- Phase 1: 10 minutes (totals row)
- Phase 2: 15 minutes (dashboard structure)
- Phase 3: 10 minutes (controls)
- Phase 4: 15 minutes (YTD summary)
- Phase 5: 20 minutes (monthly summary)
- Phase 6: 15 minutes (prepaid tracker)
- Phase 7: 25 minutes (environment table)
- Phase 8: 15 minutes (month-over-month)
- Phase 9: 20 minutes (charts)
- Phase 10: 15 minutes (formatting & testing)

### **Monthly Maintenance:** 5-10 minutes
1. Add new month data to data sheet
2. Update totals row range if needed
3. Select new month in dashboard dropdown
4. Review updated numbers

## **🎯 Key Benefits:**

✅ **Simplified approach** using totals row references  
✅ **Executive-ready presentation** with professional formatting  
✅ **Comprehensive tracking** of all required metrics  
✅ **CAD currency consistency** throughout  
✅ **Flexible month filtering** for detailed analysis  
✅ **Automatic calculations** with minimal manual work  
✅ **Easy maintenance** with your existing workflow  

**Your dashboard is now ready for executive presentations!**