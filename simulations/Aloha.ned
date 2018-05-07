//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 1992-2015 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//

package aloha.simulations;

import aloha.Server;
import aloha.Host;

import wampinterfaceforomnetpp.SimulationCallee;

//
// The Aloha network consists of hosts which talk to the central "server" via
// the Aloha or Slotted Aloha protocol
//
network Aloha
{
    parameters:
        int numHosts;  // number of hosts
        double txRate @unit(bps);  // transmission rate
        double slotTime @unit(ms);  // zero means no slots (pure Aloha)
        @display("bgi=background/terrain,s;bgb=1000,1000");
    submodules:
        callee: SimulationCallee;
        server: Server;
        host[numHosts]: Host {
            txRate = txRate;
            slotTime = slotTime;
        }
}

