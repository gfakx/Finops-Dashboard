# PIVOT TABLE + SLICER Implementation Guide
## Executive Cloud FinOps Dashboard - Professional Approach

---

# 🎯 **OVERVIEW: WHAT WE'RE BUILDING**

## **Final Dashboard Features:**
- **Month Slicer:** Select any month OR "All Months" for YTD
- **Environment Breakdown:** Dynamic table showing selected month(s) data
- **Executive Summary:** Key metrics that adapt to selection
- **AWS Prepaid Tracker:** Real-time balance monitoring
- **Professional Charts:** Auto-updating based on slicer selection
- **Single Data Source:** Everything from your Data_Entry sheet

## **How Slicers Work:**
- **Select "May-2025"** → See only May data across all tables
- **Select multiple months** → See combined totals (YTD view)
- **Select "All"** → See breakdown by all months
- **One click changes entire dashboard**

---

# 🎯 **PHASE 1: PREPARE YOUR DATA SOURCE (15 minutes)**

## **Step 1.1: Convert Data to Excel Table**

### **What you're doing:** Converting your data range to a structured table for pivot tables

### **Detailed Instructions:**

1. **Go to your Data_Entry sheet**

2. **Select your entire data range:**
   - Click cell **A1**
   - Press **Ctrl+Shift+End** to select all data
   - This should select from A1 to V55 (including your totals row)

3. **Convert to Table:**
   - Press **Ctrl+T** (or Insert tab → Table)
   - Verify "My table has headers" is checked
   - Click **OK**

4. **Name your table:**
   - With table selected, go to **Table Design tab**
   - In "Table Name" box (top left), change from "Table1" to: **CloudCostData**

5. **Remove totals row from table:**
   - **Important:** We'll exclude Row 55 from the table since pivot tables calculate totals automatically
   - Click on Row 55 → Right-click → "Delete" → "Table Rows"
   - Your table should now end at Row 54

### **What this accomplishes:**
- Creates structured data source for pivot tables
- Enables automatic range expansion when you add new data
- Provides foundation for professional slicers

---

# 🎯 **PHASE 2: CREATE DASHBOARD SHEET STRUCTURE (10 minutes)**

## **Step 2.1: Set Up Dashboard Layout**

### **Detailed Instructions:**

1. **Create new worksheet:**
   - Right-click sheet tab → Insert → Worksheet
   - Rename to: **Executive_Dashboard**

2. **Create header section:**
   
   **Cells A1:H1:**
   - Merge cells A1:H1
   - Type: **EXECUTIVE CLOUD FINANCIAL DASHBOARD**
   - Format: Bold, Size 18, Dark Blue background, White text, Center alignment

   **Cells A2:H2:**
   - Merge cells A2:H2  
   - Type: **Financial Year: Apr-2025 to Mar-2026**
   - Format: Bold, Size 14, Light Blue background, Center alignment

   **Cell A3:**
   - Type: **Last Updated:**
   - Format: Bold

   **Cell C3:**
   - Type: **=TODAY()**
   - Format as Date

3. **Create slicer placement areas:**
   - **A5:** Type "DASHBOARD CONTROLS" (Bold, Size 12)
   - Leave rows 6-10 empty for slicers
   - **A12:** Type "EXECUTIVE SUMMARY" (Bold, Size 12)  
   - **A25:** Type "ENVIRONMENT ANALYSIS" (Bold, Size 12)
   - **A40:** Type "PREPAID CREDIT TRACKER" (Bold, Size 12)

### **What this accomplishes:**
- Professional header for executive presentations
- Organized layout with designated areas for each component
- Space reserved for slicers and pivot tables

---

# 🎯 **PHASE 3: CREATE CORE PIVOT TABLES (25 minutes)**

## **Step 3.1: Executive Summary Pivot Table**

### **What you're doing:** Creating main KPI table that responds to slicers

### **Detailed Instructions:**

1. **Create first pivot table:**
   - Go to **Data_Entry sheet**
   - Click anywhere in your **CloudCostData** table
   - **Insert tab** → **PivotTable** → **New Worksheet**

2. **Set up Executive Summary pivot:**
   
   **Drag fields to areas:**
   - **Rows:** (Leave empty for summary table)
   - **Values:** 
     - Drag **Gross_CAD** → Values area
     - Drag **Net_CAD** → Values area  
     - Drag **SSC_Fee_CAD** → Values area
     - Drag **Savings_Plan_CAD** → Values area
     - Drag **Bundle_Discount_CAD** → Values area
     - Drag **Enterprise_Discount_CAD** → Values area

3. **Configure value fields:**
   - Click dropdown arrow on **Sum of Gross_CAD** → **Value Field Settings**
   - Change "Custom Name" to: **Total Gross Cost (CAD)**
   - Repeat for all fields with appropriate names:
     - **Total Net Cost (CAD)**
     - **Total SSC Fees (CAD)**  
     - **Total Savings Plans (CAD)**
     - **Total Bundle Discounts (CAD)**
     - **Total Enterprise Discounts (CAD)**

4. **Move pivot table to dashboard:**
   - Select entire pivot table → **Cut** (Ctrl+X)
   - Go to **Executive_Dashboard** sheet
   - Click cell **A14** → **Paste** (Ctrl+V)

### **Step 3.2: Environment Breakdown Pivot Table**

### **Detailed Instructions:**

1. **Create second pivot table:**
   - Go back to **Data_Entry sheet**
   - **Insert tab** → **PivotTable** → **New Worksheet**

2. **Set up Environment Analysis pivot:**
   
   **Drag fields to areas:**
   - **Rows:** **Environment**
   - **Values:**
     - **Gross_CAD** (rename to "Gross Cost")
     - **Net_CAD** (rename to "Net Cost")  
     - **SSC_Fee_CAD** (rename to "SSC Fees")
     - **Account_Count** (rename to "Total Accounts")

3. **Add calculated field for Total Cost:**
   - **PivotTable Analyze tab** → **Fields, Items & Sets** → **Calculated Field**
   - Name: **Total Final Cost**
   - Formula: **=Net_CAD+SSC_Fee_CAD**
   - Click **OK**

4. **Add calculated field for Total Savings:**
   - Create another calculated field
   - Name: **Total Savings**  
   - Formula: **=Savings_Plan_CAD+Bundle_Discount_CAD+Enterprise_Discount_CAD**

5. **Add calculated field for Savings Rate:**
   - Create another calculated field
   - Name: **Savings Rate**
   - Formula: **=Total_Savings/Gross_CAD**
   - Format as Percentage

6. **Move to dashboard:**
   - Cut pivot table → Paste to **Executive_Dashboard** at cell **A27**

### **Step 3.3: Monthly Trend Pivot Table**

### **Detailed Instructions:**

1. **Create third pivot table:**
   - **Insert tab** → **PivotTable** → **New Worksheet**

2. **Set up Monthly Trends:**
   
   **Drag fields to areas:**
   - **Rows:** **Date**
   - **Values:**
     - **Gross_CAD**
     - **Net_CAD**
     - **SSC_Fee_CAD**

3. **Group dates by month:**
   - Right-click any date in the pivot table
   - Select **Group**
   - Choose **Months** and **Years**
   - Click **OK**

4. **Move to dashboard:**
   - Cut pivot table → Paste to **Executive_Dashboard** at cell **F27**

### **What this accomplishes:**
- Three interconnected pivot tables that will respond to slicers
- Professional data presentation with automatic calculations
- Foundation for executive-level insights

---

# 🎯 **PHASE 4: CREATE AND CONNECT SLICERS (20 minutes)**

## **Step 4.1: Add Month Slicer**

### **What you're doing:** Creating the primary filter control for month selection

### **Detailed Instructions:**

1. **Create Month Slicer:**
   - Click anywhere in your **Executive Summary** pivot table (cell A14 area)
   - **PivotTable Analyze tab** → **Insert Slicer**
   - Check **Date** → Click **OK**

2. **Format the slicer:**
   - **Slicer Tools Design tab** → Choose professional style
   - **Slicer Settings:** Right-click slicer → **Slicer Settings**
   - Change "Caption" to: **Select Month(s)**
   - Check "Hide items with no data"

3. **Position the slicer:**
   - Drag slicer to cell **B6** area (under Dashboard Controls)
   - Resize to appropriate size

4. **Connect slicer to all pivot tables:**
   - Right-click slicer → **Report Connections**
   - Check all three pivot tables:
     - Executive Summary
     - Environment Breakdown  
     - Monthly Trends
   - Click **OK**

### **Step 4.2: Add Environment Slicer (Optional)**

### **Detailed Instructions:**

1. **Create Environment Slicer:**
   - Click in **Environment Breakdown** pivot table
   - **Insert Slicer** → Check **Environment** → **OK**

2. **Format and position:**
   - Position next to Month slicer (cell **E6** area)
   - Connect to all pivot tables
   - Caption: **Filter by Environment**

### **What this accomplishes:**
- Single-click month filtering across entire dashboard
- Professional slicer interface for executive use
- Connected tables that update simultaneously

---

# 🎯 **PHASE 5: ADD AWS PREPAID TRACKER (15 minutes)**

## **Step 5.1: Create Prepaid Balance Monitor**

### **What you're doing:** Building a dynamic prepaid credit tracker

### **Detailed Instructions:**

1. **Go to cell A42** (under Prepaid Credit Tracker header)

2. **Create tracker layout:**
   
   **A42:** **Starting Balance (CAD):**
   **C42:** **6147000** (adjust to your actual starting balance)

   **A43:** **Current Depletion (CAD):**
   **C43:** **=SUMIFS(CloudCostData[Net_CAD],CloudCostData[Environment],"AWS_ASEA")+SUMIFS(CloudCostData[Net_CAD],CloudCostData[Environment],"AWS_LZ")**

   **A44:** **Remaining Balance (CAD):**
   **C44:** **=C42-C43**

   **A45:** **Monthly Burn Rate:**
   **C45:** **=C43/2** (adjust denominator based on months of data)

   **A46:** **Estimated Months Left:**
   **C46:** **=IF(C45>0,C44/C45,999)**

3. **Format the tracker:**
   - Format **C42:C46** as Currency
   - Add borders around the section
   - Apply conditional formatting to **C44**:
     - Red if < 1,000,000
     - Yellow if < 2,000,000
     - Green if > 2,000,000

### **What this accomplishes:**
- Real-time AWS prepaid balance monitoring
- Automatic depletion calculation
- Executive alerts for low balance

---

# 🎯 **PHASE 6: CREATE DYNAMIC CHARTS (20 minutes)**

## **Step 6.1: Monthly Trend Chart**

### **What you're doing:** Creating charts that respond to slicer selections

### **Detailed Instructions:**

1. **Create chart from Monthly Trends pivot:**
   - Click anywhere in **Monthly Trends** pivot table
   - **Insert tab** → **Charts** → **Line Chart** → **Line with Markers**

2. **Format the chart:**
   - **Chart Title:** "Monthly Cost Trends (CAD)"
   - **Chart Tools Design** → Choose professional style
   - Position chart in area **F40:K50**

3. **Make chart responsive to slicers:**
   - Chart automatically updates when slicers change
   - Test by changing month selection

### **Step 6.2: Environment Distribution Chart**

### **Detailed Instructions:**

1. **Create chart from Environment pivot:**
   - Click in **Environment Breakdown** pivot table
   - **Insert** → **Pie Chart** → **3D Pie**

2. **Format chart:**
   - Title: "Cost Distribution by Environment"
   - Add data labels showing percentages
   - Position in area **F14:K24**

### **What this accomplishes:**
- Visual representation that updates with slicer changes
- Executive-friendly charts for presentations
- Dynamic data visualization

---

# 🎯 **PHASE 7: ADD CALCULATED INSIGHTS (15 minutes)**

## **Step 7.1: Create Summary Cards**

### **What you're doing:** Adding key metrics that reference pivot table data

### **Detailed Instructions:**

1. **Create KPI cards starting at A14:**

   **Total Monthly Cost Card:**
   - **A16:** **Total Monthly Cost:**
   - **C16:** **=GETPIVOTDATA("Total Final Cost",A14)** 
   *(This references your Executive Summary pivot)*

   **Savings Rate Card:**
   - **A17:** **Overall Savings Rate:**
   - **C17:** **=GETPIVOTDATA("Total Savings",A14)/GETPIVOTDATA("Total Gross Cost (CAD)",A14)**
   - Format as percentage

   **Account Summary:**
   - **A18:** **Total Accounts:**
   - **C18:** **=GETPIVOTDATA("Total Accounts",A27)**
   *(References Environment Breakdown pivot)*

2. **Format KPI cards:**
   - Use large, bold fonts for values
   - Add colored backgrounds
   - Create card-like appearance with borders

### **What this accomplishes:**
- Executive summary that updates with slicer selections
- Key metrics prominently displayed
- Professional KPI presentation

---

# 🎯 **PHASE 8: TEST AND VALIDATE (15 minutes)**

## **Step 8.1: Comprehensive Testing**

### **What you're doing:** Ensuring all components work together

### **Testing Procedure:**

1. **Test Month Slicer:**
   - **Select "May-2025"** → Verify all tables show only May data
   - **Select "Apr-2025"** → Verify switch to April data
   - **Select both months** → Verify combined totals (YTD view)
   - **Clear selection** → Verify shows all data

2. **Test Environment Slicer:**
   - **Select "AWS_ASEA"** → Verify filtering works
   - **Select multiple environments** → Test combined view
   - **Clear selection** → Back to all environments

3. **Test Prepaid Tracker:**
   - Verify balance calculations are correct
   - Check conditional formatting triggers
   - Validate depletion calculations

4. **Test Charts:**
   - Change slicer selections → Verify charts update
   - Check chart titles and labels
   - Ensure professional appearance

### **Step 8.2: Data Validation**

1. **Cross-check totals:**
   - Compare pivot table totals with your original data
   - Verify calculated fields are accurate
   - Check percentage calculations

2. **Add new test data:**
   - Add a June record to your CloudCostData table
   - **Right-click any pivot table** → **Refresh**
   - Verify new month appears in slicers

### **What this accomplishes:**
- Ensures dashboard functions correctly for executives
- Validates all calculations and connections
- Confirms professional presentation quality

---

# 🎯 **PHASE 9: FINAL FORMATTING & POLISH (20 minutes)**

## **Step 9.1: Professional Styling**

### **What you're doing:** Making the dashboard executive-ready

### **Detailed Instructions:**

1. **Consistent Formatting:**
   
   **Headers:**
   - All section headers: Bold, Size 14, Blue color
   - Consistent spacing between sections
   - Professional font (Calibri or Segoe UI)

   **Tables:**
   - Currency format: $#,##0 (no decimals)
   - Percentage format: 0.0%
   - Consistent column widths
   - Professional table styles

2. **Color Scheme:**
   - **AWS environments:** Light orange backgrounds
   - **Azure environments:** Light blue backgrounds  
   - **Totals rows:** Gray backgrounds
   - **KPI cards:** Gradient backgrounds

3. **Spacing and Layout:**
   - Consistent margins between components
   - Aligned elements
   - Proper white space usage
   - Professional grid layout

### **Step 9.2: Add Refresh Instructions**

1. **Create refresh section:**
   - **A50:** **MONTHLY UPDATE PROCESS**
   - **A52:** **1. Add new month data to Data_Entry sheet**
   - **A53:** **2. Right-click any pivot table → Refresh All**
   - **A54:** **3. Dashboard automatically updates**

### **What this accomplishes:**
- Executive-ready professional appearance
- Clear instructions for monthly maintenance
- Consistent branding and styling

---

# 🎯 **PHASE 10: CREATE USER GUIDE (10 minutes)**

## **Step 10.1: Dashboard Usage Instructions**

### **What you're doing:** Creating executive user guide

### **Detailed Instructions:**

1. **Add instructions panel:**
   
   **Cell M5:** **DASHBOARD USAGE GUIDE**
   
   **M7:** **Month Selection:**
   **M8:** **• Select single month for monthly view**
   **M9:** **• Select multiple months for YTD view**
   **M10:** **• Clear selection to see all data**

   **M12:** **Environment Filter:**
   **M13:** **• Filter by specific cloud environments**
   **M14:** **• Multi-select for comparisons**

   **M16:** **Key Features:**
   **M17:** **• All tables update together**
   **M18:** **• Charts respond to selections**
   **M19:** **• Prepaid balance tracks automatically**

### **What this accomplishes:**
- Clear instructions for executive users
- Self-explanatory dashboard operation
- Professional user experience

---

# 🎯 **SUMMARY: YOUR COMPLETED DASHBOARD**

## **✅ What You've Built:**

### **Executive Features:**
- **Professional Slicers** for month and environment filtering
- **Dynamic Pivot Tables** that update together
- **AWS Prepaid Tracker** with real-time monitoring
- **Responsive Charts** for visual analysis
- **Executive Summary Cards** with key metrics

### **Three Usage Scenarios (Your Requirements):**

#### **Scenario 1: Monthly Detail View**
- **Select specific month** in slicer
- **See detailed breakdown** for that month only
- **Environment table** shows month-specific data
- **Charts focus** on selected month

#### **Scenario 2: YTD Summary View**
- **Select multiple months** (Apr + May) in slicer
- **See combined totals** across selected period
- **Automatic YTD calculations** in all tables
- **Cumulative view** of performance

#### **Scenario 3: All Months Breakdown**
- **Clear all selections** or select all months
- **See month-by-month trends** in tables
- **Compare performance** across all periods
- **Full historical view** of data

### **Key Benefits:**
✅ **Single Data Source** - Everything from CloudCostData table  
✅ **No Complex Formulas** - Pivot tables handle calculations  
✅ **Professional Appearance** - Executive-ready presentation  
✅ **Automatic Updates** - Add data, refresh, done  
✅ **Interactive Filtering** - One-click view changes  
✅ **CAD Currency** - Consistent reporting currency  
✅ **Real-time Insights** - Prepaid balance monitoring  

## **⏱️ Time Investment:**

### **One-Time Setup:** 3-4 hours
- **Phase 1-2:** 25 minutes (data prep & structure)
- **Phase 3:** 25 minutes (pivot tables)
- **Phase 4:** 20 minutes (slicers)
- **Phase 5-6:** 35 minutes (tracker & charts)
- **Phase 7-10:** 60 minutes (insights, testing, formatting)

### **Monthly Maintenance:** 3-5 minutes
1. **Add new month data** to CloudCostData table
2. **Right-click any pivot table** → **Refresh All**
3. **New month automatically appears** in slicers
4. **Dashboard ready for executive review**

## **🎯 Executive Experience:**

**Executives can now:**
- **Select any month** → See instant detailed breakdown
- **Select YTD view** → See cumulative performance  
- **Filter by environment** → Focus on specific areas
- **View trends** → Understanding cost trajectories
- **Monitor prepaid balance** → Proactive financial management

**Your dashboard now delivers exactly what the visual guide promised - professional, interactive, and executive-ready!**