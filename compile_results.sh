#!/bin/bash
OUTFILE="full_stats.txt"
echo -n "" > "${OUTFILE}"
for stat in simSeconds simInsts simOps system.cpu.cpi system.cpu.squashedInstsIssued system.cpu.squashedInstsExamined system.cpu.numIssuedDist::mean system.cpu.dcache.overallMissRate::cpu.data system.cpu.icache.overallMissRate::total system.l2cache.overallMissRate::total system.l2cache.overallMissRate::total system.l2cache.overallMissRate::total system.cpu.bac.branchMisspredict system.cpu.bac.noBranchMisspredict system.cpu.bac.branches system.cpu.rename.ROBFullEvents system.cpu.rename.IQFullEvents system.cpu.rename.LQFullEvents system.cpu.rename.LQFullEvents system.cpu.rename.SQFullEvents system.mem_ctrl.dram.rank0.averagePower system.mem_ctrl.dram.rank0.totalEnergy system.mem_ctrl.dram.rank1.totalEnergy system.cpu.issuedInstType_0::MemRead system.cpu.issuedInstType_0::MemWrite system.cpu.issuedInstType_0::No_OpClass system.cpu.issuedInstType_0::IntAlu system.cpu.issuedInstType_0::IntMult ; do
    echo $stat >> ${OUTFILE}
    for WORKLOAD in bubble compress; do
        echo "   $WORKLOAD" >> ${OUTFILE}
        for arch in x86 riscv; do
            printf "      %-20s" $arch >> ${OUTFILE}
            grep -o $stat\ \ *[0-9.]* ./${arch}_${WORKLOAD}_results/stats.txt | awk '{print $2}' >> ${OUTFILE}
        done
    done
done
