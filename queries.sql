-- ============================================================
-- Customer Churn Analysis — SQL Queries
-- Author: Nagaswetha Kaikala
-- ============================================================

-- 1. Overall churn rate
SELECT
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(SUM(churned) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customers;

-- 2. Churn rate by plan
SELECT
    plan,
    COUNT(*) AS total,
    SUM(churned) AS churned,
    ROUND(AVG(churned) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charge
FROM customers
GROUP BY plan
ORDER BY churn_rate_pct DESC;

-- 3. Revenue at risk from churned customers
SELECT
    plan,
    SUM(monthly_charges) AS monthly_revenue_at_risk,
    COUNT(*) AS churned_customers
FROM customers
WHERE churned = 1
GROUP BY plan
ORDER BY monthly_revenue_at_risk DESC;

-- 4. High-risk active customers (not yet churned but showing warning signs)
SELECT
    c.customer_id,
    c.plan,
    c.tenure_months,
    c.monthly_charges,
    c.satisfaction_score,
    c.support_calls,
    COUNT(t.ticket_id) AS total_tickets,
    SUM(CASE WHEN t.resolution = 'Escalated' THEN 1 ELSE 0 END) AS escalated_tickets
FROM customers c
LEFT JOIN support_tickets t ON c.customer_id = t.customer_id
WHERE c.churned = 0
  AND c.satisfaction_score < 5
  AND c.support_calls >= 3
  AND c.tenure_months < 12
GROUP BY c.customer_id, c.plan, c.tenure_months,
         c.monthly_charges, c.satisfaction_score, c.support_calls
ORDER BY c.satisfaction_score ASC, c.support_calls DESC;

-- 5. Customer Lifetime Value by segment
SELECT
    segment,
    COUNT(*) AS customers,
    ROUND(AVG(tenure_months), 1) AS avg_tenure_months,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charge,
    ROUND(AVG(total_charges), 2) AS avg_lifetime_value,
    ROUND(AVG(churned) * 100, 1) AS churn_rate_pct
FROM customers
GROUP BY segment
ORDER BY avg_lifetime_value DESC;

-- 6. Support ticket analysis — issue types driving churn
SELECT
    t.issue_type,
    COUNT(*) AS total_tickets,
    ROUND(AVG(t.days_to_resolve), 1) AS avg_days_to_resolve,
    ROUND(AVG(c.churned) * 100, 1) AS customer_churn_rate_pct,
    ROUND(AVG(t.satisfaction_after), 2) AS avg_post_satisfaction
FROM support_tickets t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY t.issue_type
ORDER BY customer_churn_rate_pct DESC;

-- 7. Late payment analysis
SELECT
    late_payment,
    COUNT(*) AS transactions,
    ROUND(AVG(c.churned) * 100, 1) AS churn_rate_of_these_customers_pct
FROM transactions tx
JOIN customers c ON tx.customer_id = c.customer_id
GROUP BY late_payment;

-- 8. Monthly revenue trend
SELECT
    SUBSTR(txn_date, 1, 7) AS month,
    COUNT(DISTINCT customer_id) AS active_customers,
    ROUND(SUM(amount), 2) AS monthly_revenue,
    SUM(late_payment) AS late_payments
FROM transactions
GROUP BY SUBSTR(txn_date, 1, 7)
ORDER BY month;

-- 9. Top 10 highest value churned customers (biggest revenue loss)
SELECT
    customer_id,
    plan,
    tenure_months,
    monthly_charges,
    total_charges,
    satisfaction_score,
    support_calls
FROM customers
WHERE churned = 1
ORDER BY total_charges DESC
LIMIT 10;

-- 10. Churn by payment method
SELECT
    payment_method,
    COUNT(*) AS customers,
    ROUND(AVG(churned) * 100, 1) AS churn_rate_pct,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charge
FROM customers
GROUP BY payment_method
ORDER BY churn_rate_pct DESC;
