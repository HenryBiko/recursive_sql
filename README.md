# Recursive SQL: Bus Boarding Simulation

Uses a recursive CTE to calculate how many passengers board each bus, given bus arrival times, bus capacities, and passenger arrival times.

## Problem

- Buses arrive at a station in order, each with a fixed **capacity**.
- A passenger can board the first bus that arrives at or after their arrival time.
- If a bus is full, remaining passengers wait for the next one.

**Goal:** return the number of passengers who board each bus.

## Approach

1. Order buses by `arrival_time` with `ROW_NUMBER()`.
2. Count the passengers waiting for each bus.
3. A **recursive CTE** walks through buses in order: each bus boards `LEAST(capacity, waiting passengers)`, and the leftover passengers roll over to the next bus.

## Files

| File | Description |
|---|---|
| `passenger_arrival.sql` | Full query |

## Concepts

Recursive CTEs · window functions (`ROW_NUMBER`) · running carry-over state in SQL

## Author

**Henry Biko** · [GitHub](https://github.com/HenryBiko) · [LinkedIn](https://www.linkedin.com/in/henrybiko)
