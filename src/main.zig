const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 166;
const risk_penalty: i32 = 4;
const latency_penalty: i32 = 2;
const weight_bonus: i32 = 5;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 92, .capacity = 81, .latency = 27, .risk = 7, .weight = 10 };
    try std.testing.expectEqual(@as(i32, 233), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "accept"));
    const signal_case_2 = Signal{ .demand = 77, .capacity = 73, .latency = 17, .risk = 21, .weight = 9 };
    try std.testing.expectEqual(@as(i32, 154), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "review"));
    const signal_case_3 = Signal{ .demand = 105, .capacity = 94, .latency = 17, .risk = 24, .weight = 6 };
    try std.testing.expectEqual(@as(i32, 204), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "accept"));
}
