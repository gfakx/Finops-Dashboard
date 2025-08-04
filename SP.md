# Concise Excel: AWS Savings Plan Renewal Analysis

## Sheet 1: Executive Decision Matrix

### A. Current State & Expiry Impact
```
     A                    B              C              D              E
1    Current Savings Plans Analysis                    As of Aug 4, 2025
2    
3    Active Plans:        Commitment     Expires        Status         Coverage
4    SP1 (Expiring)      $100/hour      Aug 30, 2025   ⚠️ 26 Days     Primary
5    SP2 (Continuing)     $28/hour      Mar 24, 2026   ✅ Active      Secondary  
6    Current Total       $128/hour      -              60% Coverage   Suboptimal
7    If No Action         $28/hour      Sep 1, 2025    13% Coverage   ❌ Critical
```

### B. Renewal Decision Matrix
```
     A                    B              C              D              E              F
1    Renewal Options Analysis                          Monthly Figures
2    
3    Option              SP Renewal     Total Commit   Coverage       Investment     Savings
4    Do Nothing          $0/hour        $28/hour       13%           $20,160        $3,800
5    Conservative        $142/hour      $170/hour      80%           $102,240       $18,500
6    AWS Recommended     $153/hour      $181/hour      85%           $110,160       $20,200
7    
8    Our Recommendation: Conservative ($142/hour renewal)
9    Reason:            Unpredictable environment + infrastructure shutdowns
10   Increase vs Current: +$42/hour (+42% vs expiring $100/hour)
11   AWS Recommends:     +$53/hour (+53% vs expiring $100/hour)  
12   Difference:         $11/hour less conservative ($8,000/month lower risk)
```

### C. Financial Justification Summary
```
     A                         B              C              D
1    Financial Impact Analysis              Conservative   AWS Option
2    
3    Renewal Amount                         $142/hour      $153/hour
4    Monthly Investment                     $102,240       $110,160
5    Monthly Savings Generated              $18,500        $20,200
6    Coverage Achievement                   80%            85%
7    ROI (Monthly)                         18.1%          18.3%
8    Risk Level                            Lower          Higher
9    
10   Annual Comparison vs Do Nothing:
11   Additional Annual Savings              $174,000       $196,800
12   Additional Annual Investment           $984,000       $1,080,000
13   Net Position Improvement              Significant     Maximum
14   
15   Why Conservative Approach:
16   • 120+ linked accounts with project volatility
17   • Ongoing infrastructure decommissioning  
18   • Expected usage reduction from optimizations
19   • $8,000/month lower commitment than AWS recommendation
20   • Maintains 100% utilization safety margin
```

## Sheet 2: Implementation Timeline

### Action Items & Deadlines
```
     A                              B              C              D
1    Implementation Timeline                       Status         Owner
2    
3    Management Approval Required   Aug 15, 2025   ⏳ Pending     [Manager]
4    Purchase Decision Deadline     Aug 20, 2025   ⏳ Pending     [Your Name]
5    Execute SP Purchase           Aug 25, 2025   ⏳ Pending     [Your Name]
6    SP1 Expiry Date              Aug 30, 2025   ⚠️ Critical   Auto
7    New SP Activation            Aug 31, 2025   ⏳ Pending     AWS
8    Coverage Verification        Sep 5, 2025    ⏳ Pending     [Your Name]
9    
10   Critical Path: 21 days until expiry
11   Buffer Time: 5 days between purchase and expiry
12   
13   Monthly Monitoring Schedule:
14   Sep 2025    Coverage/Utilization Review       [Your Name]
15   Oct 2025    Performance vs Projection         [Your Name]  
16   Nov 2025    Quarterly Optimization Analysis   [Your Name]
```

## Sheet 3: Risk Analysis

### Conservative vs AWS Recommendation Comparison
```
     A                           B                 C                 D
1    Risk Factor Analysis        Conservative      AWS Recommended   Advantage
2    
3    Commitment Level           $142/hour         $153/hour         Lower
4    Monthly Investment         $102,240          $110,160          -$7,920
5    Coverage Target            80%               85%               Adequate
6    Utilization Safety         High              Medium            Better
7    Environment Flexibility    High              Lower             Better
8    Over-commitment Risk       Low               Medium            Better
9    Maximum Savings Capture    87%               100%              AWS
10   
11   Scenario Planning:
12   If Usage Drops 10%:
13   - Conservative Utilization  89%               95%               Safer
14   - AWS Utilization          84%               90%               Risk
15   
16   If Environment Shutdowns:
17   - Conservative Impact       Manageable        Higher Risk       Safer
18   - AWS Impact               Acceptable        Over-commitment   Risk
19   
20   Recommendation: Conservative approach provides optimal balance
21   between savings capture and risk management in our dynamic
22   environment with ongoing infrastructure optimization.
```

## Key Excel Formulas:

### Monthly Cost Calculations:
```excel
// Monthly Commitment Cost (Cell C5)
=B5*24*30

// Coverage Percentage (Cell D5)  
=B5/213*100

// Monthly Savings (Cell E5)
=C5*0.30

// ROI Calculation (Cell D7)
=(E5/C5)*100
```

### Conditional Formatting:
```
Coverage %:
- Red: <70% (Critical)
- Yellow: 70-79% (Monitor) 
- Green: ≥80% (Target)

Investment Level:
- Green: <$100k/month
- Yellow: $100-120k/month
- Red: >$120k/month
```

---

## Executive Summary for Attachment:

**Decision Required:** Renew expiring $100/hour Savings Plan at $142/hour (+$42 increase)

**Alternative:** AWS recommends $153/hour (+$53 increase)

**Our Recommendation:** Conservative $142/hour due to:
- Unpredictable cloud environment
- Ongoing infrastructure shutdowns  
- Expected usage reduction from optimizations
- $8,000/month lower risk than AWS recommendation

**Financial Impact:** 80% coverage, $18,500/month savings, 18.1% ROI

**Timeline:** Decision needed by August 20th, purchase by August 25th