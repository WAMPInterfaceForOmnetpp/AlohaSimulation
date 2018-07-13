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
        callee: SimulationCallee {
            @display("p=947.776,52.208");
        }
        BaseStation: Server {
            @display("p=500,500");
        }
        host[numHosts]: Host {
            @display("i=device/accesspoint;p=44.176,959.824;is=s");
            txRate = txRate;
            slotTime = slotTime;
        }
}

