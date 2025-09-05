import React, { useState, useEffect } from 'react'
import apiClient from './Api.js'
import './App.css'
import Box from '@mui/material/Box'

const PostTest = ( {id} ) => {
  var route = '/projetos/' + id + '/interesses'
  apiClient.post(route, {
      email: 'bruno.m.sales03@gmail.com',
      nome: 'breno',
      telefone: '1239587',
  })
  .then(response => {console.log('Response:', response.data)})
  .catch(error => {console.log('error:', error)})
}

const Project = ({ project_id, project, coordinator, center }) => (
  <Box component="section" sx={{width: 1200, height: 350, borderRadius: 1, bgcolor: 'primary.main', '&:hover':{ bgcolor: 'primary.dark'},}}>
    <h2>{project}</h2>
      <h4>{coordinator}</h4>
      <h1>{center}</h1>
    <button onClick={() => PostTest({id: project_id})}>click me</button>
  </Box>
)

const ProjectList = ({ center }) => {
  const [projects, setProjects] = useState([])
  var route = '/projetos/' + center

  useEffect(() => {
    const fetchProjects = async () => {
      try {
        const response = await apiClient.get(route)
        setProjects(response.data)
      } catch (error) {
        console.error('Error fetching projects:', error)
      }
    }

    fetchProjects()
  }, [])

  return (
    <div>
      {projects.map((proj) => (
        <Project
          key={proj.id}
          project_id={proj.id}
          project={proj.projeto}
          coordinator={proj.coordenador}
          center={proj.instituicao}
        />
      ))}
    </div>
  )
}

function App() {
  const [isCCT, setIsCCT] = useState(false)
  const [isCCH, setIsCCH] = useState(false)
  const [isCBB, setIsCBB] = useState(false)
  const [isCCTA, setIsCCTA] = useState(false)

  const displayCCTProjects = () => {
    setIsCCT(!isCCT)
  }
  const displayCCHProjects = () => {
    setIsCCH(!isCCH)
  }
  const displayCBBProjects = () => {
    setIsCBB(!isCBB)
  }
  const displayCCTAProjects = () => {
    setIsCCTA(!isCCTA)
  }
  return (
    <>
      <h1>PROJETOS DE EXTENSÃO DA UENF</h1>
      <div>
        <button onClick={displayCCTProjects}>
          Projetos CCT
        </button>

        {isCCT &&(
          <ProjectList center="CCT"/>
        )}
      </div>

      <div>
        <button onClick={displayCCHProjects}>
          Projetos CCH
        </button>

        {isCCH &&(
          <ProjectList center="CCH"/>
        )}
      </div>

      <div>
        <button onClick={displayCBBProjects}>
          Projetos CBB
        </button>

        {isCBB &&(
          <ProjectList center="CBB"/>
        )}
      </div>

      <div>
        <button onClick={displayCCTAProjects}>
          Projetos CCTA
        </button>

        {isCCTA &&(
          <ProjectList center="CCTA"/>
        )}
      </div>
    </>
  )
}

export default App

