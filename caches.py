# caches_hw8.py
# Cache hierarchy for HW #8 (Intel Broadwell configuration)
# L1: 32 KiB, 8-way, latency 4
# L2: 256 KiB, 8-way, latency 12

import m5
from m5.objects import Cache


class L1ICache(Cache):
    size = "32KiB"
    assoc = 4
    tag_latency = 4
    data_latency = 4
    response_latency = 4
    mshrs = 4
    tgts_per_mshr = 20

    def connectCPU(self, cpu):
        self.cpu_side = cpu.icache_port

    def connectBus(self, bus):
        self.mem_side = bus.cpu_side_ports


class L1DCache(Cache):
    size = "32KiB"
    assoc = 4
    tag_latency = 4
    data_latency = 4
    response_latency = 4
    mshrs = 4
    tgts_per_mshr = 20

    def connectCPU(self, cpu):
        self.cpu_side = cpu.dcache_port

    def connectBus(self, bus):
        self.mem_side = bus.cpu_side_ports


class L2Cache(Cache):
    size = "1MiB"
    assoc = 16
    tag_latency = 12
    data_latency = 12
    response_latency = 12
    mshrs = 20
    tgts_per_mshr = 12

    def connectCPUSideBus(self, bus):
        self.cpu_side = bus.mem_side_ports

    def connectMemSideBus(self, bus):
        self.mem_side = bus.cpu_side_ports
