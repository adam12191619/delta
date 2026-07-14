import React from 'react';
import { View, Text, StyleSheet, FlatList, TouchableOpacity } from 'react-native';
import { GlassCard, NeonText, FloatingOrb } from '../components/motion';
import { Cpu, Globe, Lock, Smartphone, Zap, Search } from 'lucide-react-native';

const TOOLS = [
  { id: '1', name: 'Port Scanner', desc: 'Audit open ports', icon: Globe, color: '#00ccff' },
  { id: '2', name: 'System Monitor', desc: 'Real-time stats', icon: Cpu, color: '#ffcc00' },
  { id: '3', name: 'Cipher Vault', desc: 'AES Encryption', icon: Lock, color: '#00ffaa' },
  { id: '4', name: 'Device Info', desc: 'Hardware details', icon: Smartphone, color: '#ff00ff' },
  { id: '5', name: 'Network Map', desc: 'Visual packet flow', icon: Zap, color: '#ff5500' },
  { id: '6', name: 'App Forensic', desc: 'APK manifest leak', icon: Search, color: '#ffffff' },
];

export default function Dashboard() {
  return (
    <View style={styles.container}>
      <FloatingOrb color="#0044ff" size={400} top={-200} left={-100} />
      <FloatingOrb color="#7700ff" size={300} top={500} left={200} />

      <View style={styles.header}>
        <View>
          <Text style={styles.welcome}>DELTA_OS v1.0</Text>
          <NeonText text="CORE_STATUS: ACTIVE" />
        </View>
        <View style={styles.statusDot} />
      </View>

      <FlatList 
        data={TOOLS}
        numColumns={2}
        keyExtractor={(item) => item.id}
        contentContainerStyle={{ padding: 15 }}
        renderItem={({ item, index }) => (
          <TouchableOpacity style={{ flex: 1 }}>
            <GlassCard delay={index * 150}>
              <item.icon color={item.color} size={30} />
              <Text style={styles.toolTitle}>{item.name}</Text>
              <Text style={styles.toolDesc}>{item.desc}</Text>
            </GlassCard>
          </TouchableOpacity>
        )}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#050505', paddingTop: 60 },
  header: { 
    flexDirection: 'row', 
    justifyContent: 'space-between', 
    alignItems: 'center', 
    paddingHorizontal: 25,
    marginBottom: 20 
  },
  welcome: { color: 'rgba(255,255,255,0.4)', fontSize: 12, letterSpacing: 3 },
  statusDot: { width: 12, height: 12, borderRadius: 6, backgroundColor: '#00ffcc', elevation: 10, shadowColor: '#00ffcc', shadowRadius: 10 },
  toolTitle: { color: '#fff', fontWeight: 'bold', marginTop: 15, fontSize: 14 },
  toolDesc: { color: 'rgba(255,255,255,0.4)', fontSize: 10, marginTop: 5 }
});
