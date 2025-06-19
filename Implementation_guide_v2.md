# Streamlined Executive Cloud FinOps Dashboard

## 📊 **Step 1: Update Your Existing Data Sheet**

### **Add SSC Fee Column**
Add a new column after "Net" (Column L):

```excel
Column L Header: "SSC_Fee"
Formula for L1 (first data row): =I1*0.1
Copy this formula down for all rows
```

### **Updated Column Structure:**
```
A: S/N | B: Environment | C: Date | D: Charges | E: Savings_Plan | F: Bundle_Discount | 
G: Enterprise_Discount | H: Credits | I: Gross | J: Taxes | K: Net | L: SSC_Fee | 
M: Exchange_Rate | N: Account_Count
```

---

## 📊 **Step 2: Create Dashboard Sheet**

### **Dashboard Sheet Layout:**

```excel
A1: "EXECUTIVE CLOUD FINANCIAL DASHBOARD"
A2: "Financial Year: Apr-2025 to Mar-2026"
A3: "Last Updated: [=TODAY()]"

// Month Filter Section (A5:D6)
A5: "Select Month for Detailed View:"
B5: [Data Validation Dropdown with unique months from your data]
A6: "View Type:"
B6: [Dropdown: "Current Month", "All Months", "YTD"]
```

---

## 📊 **Step 3: Key Metrics Summary**

### **Financial Year Summary (A8:F15):**

```excel
A8: "FINANCIAL YEAR SUMMARY (Apr-2025 to Mar-2026)"

A10: "Total Gross Cost:"        B10: =SUMIF(Data!C:C,">=4/1/2025",Data!I:I)
A11: "Total Savings:"           B11: =SUMIF(Data!C:C,">=4/1/2025",Data!E:E)+SUMIF(Data!C:C,">=4/1/2025",Data!F:F)+SUMIF(Data!C:C,">=4/1/2025",Data!G:G)
A12: "Total Net Cost:"          B12: =SUMIF(Data!C:C,">=4/1/2025",Data!K:K)
A13: "Total SSC Fees:"          B13: =SUMIF(Data!C:C,">=4/1/2025",Data!L:L)
A14: "Total Final Cost:"        B14: =B12+B13
A15: "Savings Rate:"            B15: =IF(B10>0,B11/B10,0)

// Format B15 as percentage
```

### **Current Month Summary (D10:F15):**

```excel
D10: "Current Month: [=B5]"
E10: =SUMIFS(Data!I:I,Data!C:C,B5)     // Gross for selected month
E11: =SUMIFS(Data!E:E,Data!C:C,B5)+SUMIFS(Data!F:F,Data!C:C,B5)+SUMIFS(Data!G:G,Data!C:C,B5)  // Savings
E12: =SUMIFS(Data!K:K,Data!C:C,B5)     // Net
E13: =SUMIFS(Data!L:L,Data!C:C,B5)     // SSC
E14: =E12+E13                          // Total
E15: =IF(E10>0,E11/E10,0)              // Savings Rate
```

---

## 📊 **Step 4: AWS Prepaid Credit Tracker**

### **Prepaid Balance Section (A17:F22):**

```excel
A17: "AWS PREPAID CREDIT TRACKER"

A19: "Starting Balance (Apr-2025):"    B19: 4500000
A20: "YTD AWS Depletion:"              B20: =SUMIFS(Data!K:K,Data!C:C,">=4/1/2025",Data!B:B,"AWS_ASEA")+SUMIFS(Data!K:K,Data!C:C,">=4/1/2025",Data!B:B,"AWS_LZ")
A21: "Remaining Balance:"              B21: =B19-B20
A22: "Depletion Rate (Monthly Avg):"   B22: =B20/MONTH(TODAY()-DATE(2025,4,1))

// Conditional Formatting for B21:
// Red if <500000, Yellow if <1000000, Green if >1000000
```

---

## 📊 **Step 5: Environment Breakdown Table**

### **Monthly Environment Summary (A24:H35):**

```excel
A24: "ENVIRONMENT BREAKDOWN - [=B5]"

A26: Headers
Environment | Gross | Net | SSC_Fee | Total_Cost | Savings | Savings_Rate | Accounts

A27: AWS_ASEA    | =SUMIFS(Data!I:I,Data!C:C,B5,Data!B:B,"AWS_ASEA")
A28: AWS_LZ      | =SUMIFS(Data!I:I,Data!C:C,B5,Data!B:B,"AWS_LZ") 
A29: AWS_CPS     | =SUMIFS(Data!I:I,Data!C:C,B5,Data!B:B,"AWS_CPS")
A30: AZURE_CORP  | =SUMIFS(Data!I:I,Data!C:C,B5,Data!B:B,"AZURE_CORP")
A31: AZURE_DPM3  | =SUMIFS(Data!I:I,Data!C:C,B5,Data!B:B,"AZURE_DPM3")
A32: TOTALS      | =SUM(B27:B31)

// Similar formulas for columns C through H using SUMIFS
```

---

## 📊 **Step 6: Create Dynamic Charts**

### **Chart 1: Monthly Trend Analysis**

```excel
// Create Pivot Table from your data:
1. Select all data (A:N)
2. Insert > Pivot Table
3. Rows: Date (Group by Month)
4. Values: Sum of Gross, Sum of Net, Sum of SSC_Fee
5. Create Line Chart from Pivot Table

// Place chart in range A37:F50
```

### **Chart 2: Environment Cost Distribution**

```excel
// Create Pivot Table:
1. Rows: Environment
2. Values: Sum of Net (for current month)
3. Create Horizontal Bar Chart

// Place chart in range H26:M35
```

### **Chart 3: Savings Composition**

```excel
// Manual data for Pie Chart:
A52: "Savings Plan:"      B52: =SUMIFS(Data!E:E,Data!C:C,B5)
A53: "Bundle Discount:"   B53: =SUMIFS(Data!F:F,Data!C:C,B5)
A54: "Enterprise Disc:"   B54: =SUMIFS(Data!G:G,Data!C:C,B5)

// Create Pie Chart from A52:B54
```

---

## 📊 **Step 7: Advanced Features**

### **Month-over-Month Comparison:**

```excel
A55: "MONTH-OVER-MONTH ANALYSIS"

A57: "Previous Month:"     B57: =[Previous month calculation]
A58: "Current Month:"      B58: =[Current month from B5]
A59: "Change ($):"         B59: =B58-B57
A60: "Change (%):"         B60: =IF(B57>0,(B58-B57)/B57,0)

// Format B60 as percentage with conditional formatting
```

### **Budget vs Actual (Optional):**

```excel
A62: "BUDGET TRACKING"
A64: "Monthly Budget:"     B64: [Enter your monthly budget]
A65: "Actual (Current):"   B65: =E14
A66: "Variance:"           B66: =B65-B64
A67: "Variance %:"         B67: =IF(B64>0,B66/B64,0)
```

---

## 📊 **Step 8: Dashboard Automation**

### **Create Simple Update Macro:**

```vba
Sub RefreshDashboard()
    Application.ScreenUpdating = False
    
    ' Refresh all pivot tables
    ActiveWorkbook.RefreshAll
    
    ' Update last modified date
    Dashboard.Range("C3").Value = "Last Updated: " & Now()
    
    ' Recalculate all formulas
    Application.Calculate
    
    Application.ScreenUpdating = True
    
    MsgBox "Dashboard refreshed successfully!"
End Sub
```

### **Add Refresh Button:**

```excel
1. Developer Tab > Insert > Button (Form Control)
2. Draw button on dashboard
3. Assign RefreshDashboard macro
4. Text: "Refresh Dashboard"
```

---

## 📊 **Step 9: Formatting for Executive Presentation**

### **Professional Styling:**

```excel
1. Title Section (A1:N3):
   - Merge cells, center alignment
   - Bold, size 16 font
   - Background color: Dark blue
   - Font color: White

2. KPI Sections:
   - Border around each section
   - Alternate row shading
   - Currency formatting for monetary values
   - Percentage formatting for rates

3. Conditional Formatting:
   - Green: Positive savings, under budget
   - Red: Over budget, low prepaid balance
   - Yellow: Warning thresholds

4. Charts:
   - Professional color scheme
   - Clear titles and axis labels
   - Data labels where appropriate
```

---

## 📋 **Monthly Update Workflow**

### **Your Simple 4-Step Process:**

1. **Add new month data** to your existing sheet (continue your current approach)
2. **Update SSC Fee column** (formula will auto-calculate)
3. **Go to Dashboard sheet** and select the new month in dropdown (B5)
4. **Click "Refresh Dashboard"** button

**Total time: 5-10 minutes per month**

---

## 🎯 **Key Benefits of This Approach:**

✅ **Keeps your current data entry** - no workflow disruption  
✅ **Executive-ready visuals** - professional dashboard for leadership  
✅ **Financial accuracy** - SSC fees and prepaid tracking included  
✅ **Flexible filtering** - view any month or YTD data  
✅ **Automated calculations** - formulas handle all the math  
✅ **Trend analysis** - month-over-month and year-to-date insights  
✅ **Minimal maintenance** - just monthly data entry + button click  

---

## 📈 **Sample Executive Insights This Will Provide:**

- "Total cloud spend this month: $XXX (X% vs last month)"
- "Savings rate: XX% (Target: 15%)"
- "AWS prepaid balance: $XXX remaining (X months at current burn rate)"
- "Top cost environment: AWS_ASEA at $XXX"
- "YTD savings: $XXX across all discount programs"

**Implementation Time: 2-3 hours**  
**Monthly Maintenance: 5-10 minutes**